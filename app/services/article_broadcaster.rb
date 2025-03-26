# class ArticleBroadcaster
#   def self.broadcast_article(article)
#     Turbo::StreamsChannel.broadcast_prepend_to("articles", target: "articles-list", partial: "articles/article", locals: { article: article })
#     broadcast_article_count
#     broadcast_analytics
#   end

#   def self.broadcast_article_count
#     aricles_count = Article.count 
#     Turbo::StreamsChannel.broadcast_update_to("articles", target: "article_count", html: aricles_count.to_s)
#   end

#   def self.broadcast_analytics
#     Turbo::StreamsChannel.broadcast_replace_to(
#       "analytics",
#       target: "analytics",
#       partial: "analytics/index",
#       locals: {
#         total_articles: Article.count,
#         read_articles: Article.where(read: true).count,
#         unread_articles: Article.where(read: false).count
#       }
#     )
#   end

# end



class ArticleBroadcaster
  def self.broadcast_article(article, action: :create)
    puts "Broadcasting article #{action}: #{article.title}"

    case action
    when :create
      Turbo::StreamsChannel.broadcast_prepend_to(
        "articles",
        target: "articles-list",
        partial: "articles/article",
        locals: { article: article }
      )
    when :update
      Turbo::StreamsChannel.broadcast_replace_to(
        "articles",
        target: dom_id(article, "id"),
        partial: "articles/article",
        locals: { article: article }
      )
    end

    broadcast_article_count
    broadcast_analytics
  end

  def self.broadcast_article_count
    articles_count = Article.count 
    Turbo::StreamsChannel.broadcast_update_to("articles", target: "article_count", html: articles_count.to_s)
  end

  def self.broadcast_analytics
    Turbo::StreamsChannel.broadcast_replace_to(
      "analytics",
      target: "analytics",
      partial: "analytics/index",
      locals: {
        total_articles: Article.count,
        read_articles: Article.where(read: true).count,
        unread_articles: Article.where(read: false).count
      }
    )
  end

  def self.dom_id(record, prefix = nil)
    ActionView::RecordIdentifier.dom_id(record, prefix)
  end
end

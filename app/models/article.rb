class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :read, type: Boolean, default: false

  after_create -> { ArticleBroadcaster.broadcast_article(self, action: :create) }
  after_update -> { ArticleBroadcaster.broadcast_article(self, action: :update) }



  ############################# BELOW IS MODEL LEVEL BROADCASTING ##################################

  # after_create :broadcast_article

  # def broadcast_article
  #   Turbo::StreamsChannel.broadcast_replace_to("articles", target: "article", html: "<div>New article!</div>")
  # end  

end

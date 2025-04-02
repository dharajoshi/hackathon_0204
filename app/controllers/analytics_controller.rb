class AnalyticsController < ApplicationController
  def index
    @total_articles = Article.count
    @read_articles = Article.where(read: true).count
    @unread_articles = Article.where(read: false).count
  end
end


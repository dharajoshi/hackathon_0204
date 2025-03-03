class PostsController < ApplicationController

  def index
    @posts= Post.order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      @posts = Post.count
      respond_to do |format|
        format.turbo_stream
      end 
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

class PostBroadcaster
  def self.broadcast_post(post)
    Turbo::StreamsChannel.broadcast_prepend_to("posts", target: "posts", partial: "posts/post", locals: { post: post })
    broadcast_post_count
  end

  def self.broadcast_post_count
    post_count = Post.count 
    Turbo::StreamsChannel.broadcast_update_to("posts", target: "count_post", html: post_count.to_s)
  end

end

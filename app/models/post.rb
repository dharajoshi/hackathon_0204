class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String

  after_create -> { PostBroadcaster.broadcast_post(self) }
end

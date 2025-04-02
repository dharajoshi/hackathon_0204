class TaskManager
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :status, type: String

  # validates :title, presence: true
  # validates :description, presence: true
  # validates :status, presence: true
  after_create -> { TaskManagerBroadcaster.broadcast(self) }
end
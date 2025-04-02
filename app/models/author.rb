class Author
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
end
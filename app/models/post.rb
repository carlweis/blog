class Post < ActiveRecord::Base
  validates :title, :presence => true, :length => {:minimum => 5}, :uniqueness => true
  validates :body, :presence => true, :length => {:minimum => 100, :maximum => 500}
  has_many :comments
end

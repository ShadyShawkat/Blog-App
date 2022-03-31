class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  validates :name, presence: true

  def last_three_posts
    posts.last(3)
  end
end

class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def last_three_posts
    posts.last(3)
  end
end

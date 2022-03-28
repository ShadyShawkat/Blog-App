class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user

  def set_user_posts_counter
    user.update(posts_counter: user.posts.count)
  end
end

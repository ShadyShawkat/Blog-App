class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  after_save :set_user_posts_counter
  def set_user_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def last_five_comments
    comments.last(5)
  end
end

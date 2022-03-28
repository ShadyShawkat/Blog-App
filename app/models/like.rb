class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  def set_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end

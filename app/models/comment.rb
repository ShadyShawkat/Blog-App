class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  after_save :set_post_comments_counter
  def set_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end

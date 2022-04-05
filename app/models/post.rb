class Post < ApplicationRecord
  has_many :likes, dependent: :destroy  
  has_many :comments, dependent: :destroy  
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :set_user_posts_counter
  after_destroy :set_user_posts_counter
  def set_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def last_five_comments
    comments.last(5)
  end
end

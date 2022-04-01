require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(
    name: 'Jim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'Teacher from Mexico',
    posts_counter: 0
  )
  post = Post.new(
    author: user, title: 'Hola', text: 'This is my first post',
    likes_counter: 0, comments_counter: 0
  )

  subject do
    Like.new(post:, author: user)
  end

  before { subject.save }

  it 'set_post_likes_counter should return a right result when called with after_save' do
    expect(subject.post.likes_counter).to eq(1)
  end
end

require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(
      post: Post.new(
        author: User.new(
          name: 'Jim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
          bio: 'Teacher from Mexico',
          posts_counter: 0
        ), title: 'Hola', text: 'This is my first post',
        likes_counter: 0, comments_counter: 0
      ),
      author: User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 0)
    )
  end

  before { subject.save }

  it 'set_post_likes_counter should return a right result when called with after_save' do
    expect(subject.post.likes_counter).to eq(1)
  end
end
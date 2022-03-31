require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(user: User.new(name: 'Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0), title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
end
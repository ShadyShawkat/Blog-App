require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(user: User.new(name: 'Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0), title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to zero' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to zero' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'subject should be valid' do
    expect(subject).to be_valid
  end

  it 'last_five_comments should return five result or lower' do
    subject.comments.create(text: 'This is my first comment')
    subject.comments.create(text: 'This is my second comment')
    subject.comments.create(text: 'This is my third comment')
    subject.comments.create(text: 'This is my fourth comment')
    subject.comments.create(text: 'This is my fifth comment')
    subject.comments.create(text: 'This is my sixth comment')
    expect(subject.last_five_comments.count).to eq(5)
  end

  it 'set_user_posts_counter should return a right result when calling it with after_save' do
    expect(subject.user.posts_counter).to eq(1)
  end
end
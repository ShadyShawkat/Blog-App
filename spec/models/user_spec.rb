require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)}

  before { subject.save }

  it 'name should be present' do 
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to zero' do 
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  it 'subject should be valid' do
    expect(subject).to be_valid
  end

  it 'last_three_posts should return a right result' do 
    subject.posts.create(title: 'Hello1', text: 'This is my first post')
    subject.posts.create(title: 'Hello2', text: 'This is my second post')
    subject.posts.create(title: 'Hello3', text: 'This is my third post')
    subject.posts.create(title: 'Hello4', text: 'This is my fourth post')
    subject.posts.create(title: 'Hello5', text: 'This is my fifth post')
    subject.posts.create(title: 'Hello6', text: 'This is my sixth post')
    expect(subject.last_three_posts.count).to eq(3)
  end
end

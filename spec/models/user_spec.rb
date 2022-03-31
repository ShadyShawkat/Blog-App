require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)}

  before { subject.save }

  it 'name should be present' do 
    subject.name = nil
    expect(subject).to_not be_valid
  end
end

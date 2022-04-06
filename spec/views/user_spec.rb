require 'rails_helper'

RSpec.describe 'User', :type => :feature do
  describe 'User index' do
    before :all do
      @firstUser = User.create(name: 'Tom', photo: 'https://placeholder.com', password:'222555', email: 'tom@example.com')
      User.create(name: 'Me', photo: 'https://placeholder.com', password:'333555', email: 'me@example.com')
      User.create(name: 'You', photo: 'https://placeholder.com', password:'4444555', email: 'you@example.com')
    end

    before :each do
      visit users_path
    end

    it 'shows the username of all users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Me')
      expect(page).to have_content('You')
    end

    it 'See the profile picture for each user' do
      all_images = page.all('img')
      expect(all_images.count).to eq(3)
    end
   
    it 'See the number of posts each user has written' do
      expect(page).to have_content("Posts: 0")
    end
   
    it 'When I click on a user, I am redirected to that user\'s show page.' do
      click_link 'Tom'
      expect(page).to have_current_path(user_path('1'))
    end

  end
end
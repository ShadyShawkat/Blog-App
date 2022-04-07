# require 'rails_helper'

# RSpec.describe 'Session', type: :feature do
#   describe 'login page' do
#     before :all do
#       @user = User.new(name: 'Tom', photo: 'https://placeholder.com', password: '222555', email: 'tom@example.com')
#       @user = User.find_by(name: 'Tom') unless @user.save
#       visit destroy_user_session_path
#     end

#     before :each do
#       visit new_user_session_path
#     end

#     it 'shows the right content' do
#       expect(page).to have_content('Email')
#       expect(page).to have_content('Password')
#       expect(page).to have_content('Log in')
#     end

#     it 'Shows an error when the login button is clicked without filling in the inputs' do
#       click_button 'Log in'
#       expect(page).to have_content('Invalid Email or password.')
#     end

#     it 'Shows an error when the login button is clicked with inputs filled incorrectly' do
#       fill_in 'Email', with: 'tom@example.com'
#       fill_in 'Password', with: '222444'
#       click_button 'Log in'
#       expect(page).to have_content('Invalid Email or password.')
#     end

#     it 'Shows a success message when the login button is clicked with inputs filled correctly' do
#       fill_in 'Email', with: 'tom@example.com'
#       fill_in 'Password', with: '222555'
#       click_button 'Log in'
#       expect(page).to have_content('Signed in successfully.')
#     end
#   end
# end

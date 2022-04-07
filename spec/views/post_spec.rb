# require 'rails_helper'

# RSpec.describe 'Post', type: :feature do
#   before :all do
#     @first_user = User.find_by(name: 'Tom')
#     if @first_user.nil?
#       @first_user = User.create(name: 'Tom', photo: 'https://placeholder.com', bio: 'User\'s bio', password: '222555',
#                                 email: 'tom@example.com')
#     end
#     visit new_user_session_path
#     fill_in 'Email', with: 'tom@example.com'
#     fill_in 'Password', with: '222555'
#     click_button 'Log in'

#     @post = @first_user.posts.find_by(title: 'Post title 1')
#     @post = @first_user.posts.create!(title: 'Post title 1', text: 'Post text 1') if @post.nil?
#     if @post.comments.empty?
#       @comment1 = @post.comments.create(text: 'Comment text 1', user_id: @first_user.id)
#       @comment2 = @post.comments.create(text: 'Comment text 2', user_id: @first_user.id)
#       @comment3 = @post.comments.create(text: 'Comment text 3', user_id: @first_user.id)
#       @comment4 = @post.comments.create(text: 'Comment text 4', user_id: @first_user.id)
#       @comment5 = @post.comments.create(text: 'Comment text 5', user_id: @first_user.id)
#     else
#       @comment1 = @post.comments.find(1)
#       @comment2 = @post.comments.find(2)
#       @comment3 = @post.comments.find(3)
#       @comment4 = @post.comments.find(4)
#       @comment5 = @post.comments.find(5)
#     end
#   end

#   describe 'index' do
#     before :each do
#       visit user_posts_path(@first_user)
#     end

#     it 'See the profile picture for each user' do
#       all_images = page.all('img')
#       expect(all_images.count).to eq(1)
#     end

#     it 'See the user\'s username' do
#       expect(page).to have_content('Tom')
#     end

#     it 'See the number of posts each user has written' do
#       expect(page).to have_content("Posts: #{@first_user.posts.count}")
#     end

#     it 'See the post title' do
#       expect(page).to have_content(@post.title)
#     end

#     it 'See the post body' do
#       expect(page).to have_content(@post.text)
#     end

#     it 'See the first comments on a post.' do
#       # expect(page).to have_current_path user_posts_path(@first_user)
#       expect(page).to have_content('Comment text 1')
#     end

#     it 'See how many comments a post has.' do
#       expect(page.find_all('ul.post-comments li').count).to eq(5)
#     end

#     it 'See how many likes a post has.' do
#       expect(page).to have_content("Likes: #{@post.likes.count}")
#     end

#     it 'Shows the post details when any post is clicked in the post show page' do
#       click_link @post.title
#       expect(page).to have_current_path(user_post_path(@first_user, @post))
#     end
#   end

#   describe 'show' do
#     before :each do
#       visit user_post_path(@first_user, @post)
#     end

#     it 'shows the correct path' do
#       expect(page).to have_current_path(user_post_path(@first_user, @post))
#     end

#     it 'See the post title' do
#       expect(page).to have_content(@post.title)
#     end

#     it 'shows who wrote the post' do
#       expect(page).to have_content(@post.author.name)
#     end

#     it 'shows how many comments the post has' do
#       expect(page).to have_content("Comments: #{@post.comments.count}")
#     end

#     it 'shows how many likes the post has' do
#       expect(page).to have_content("Likes: #{@post.likes.count}")
#     end

#     it 'shows the post body' do
#       expect(page).to have_content(@post.text)
#     end

#     it 'shows who wrote the comment' do
#       expect(page).to have_content("#{@comment1.author.name}:   #{@comment1.text}")
#     end

#     # it 'shows the user post count' do
#     #   expect(page).to have_content("Posts: #{@first_user.posts.count}")
#     # end

#     # it 'shows the user bio' do
#     #   expect(page).to have_content(@first_user.bio)
#     # end

#     # it 'shows the user\'s first three posts' do
#     #   expect(page.find_all('div', class: 'post-card').count).to eq(3)
#     # end

#     # it 'shows the user\'s posts when any post is clicked' do
#     #   click_link @post1.title
#     #   expect(page).to have_current_path(user_posts_path(@first_user))
#     # end

#     # it 'shows the post details when any post is clicked in the post index page' do
#     #   click_link @post1.title
#     #   click_link @post1.title
#     #   expect(page).to have_current_path(user_post_path(@first_user, @post1))
#     # end
#   end
# end

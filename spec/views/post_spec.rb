require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before :all do
    @firstUser = User.find_by(name: 'Tom')
    if @firstUser.nil?
      @firstUser = User.create(name: 'Tom', photo: 'https://placeholder.com', bio: 'User\'s bio', password: '222555',
                               email: 'tom@example.com')
    end
    visit new_user_session_path
    fill_in 'Email', with: 'tom@example.com'
    fill_in 'Password', with: '222555'
    click_button 'Log in'

    @post = @firstUser.posts.find_by(title: 'Post title 1')
    @post = @firstUser.posts.create!(title: 'Post title 1', text: 'Post text 1') if @post.nil?
    if @post.comments.empty?
      @comment1 = @post.comments.create(text: 'Comment text 1', user_id: @firstUser.id)
      @comment2 = @post.comments.create(text: 'Comment text 2', user_id: @firstUser.id)
      @comment3 = @post.comments.create(text: 'Comment text 3', user_id: @firstUser.id)
      @comment4 = @post.comments.create(text: 'Comment text 4', user_id: @firstUser.id)
      @comment5 = @post.comments.create(text: 'Comment text 5', user_id: @firstUser.id)
    else
      @comment1 = @post.comments.find(1)
      @comment2 = @post.comments.find(2)
      @comment3 = @post.comments.find(3)
      @comment4 = @post.comments.find(4)
      @comment5 = @post.comments.find(5)
    end
  end

  describe 'index' do
    before :each do
      visit user_posts_path(@firstUser)
    end

    it 'See the profile picture for each user' do
      all_images = page.all('img')
      expect(all_images.count).to eq(1)
    end

    it 'See the user\'s username' do
      expect(page).to have_content('Tom')
    end

    it 'See the number of posts each user has written' do
      expect(page).to have_content("Posts: #{@firstUser.posts.count}")
    end

    it 'See the post title' do
      expect(page).to have_content(@post.title)
    end

    it 'See the post body' do
      expect(page).to have_content(@post.text)
    end

    it 'See the first comments on a post.' do
      # expect(page).to have_current_path user_posts_path(@firstUser)
      expect(page).to have_content('Comment text 1')
    end

    it 'See how many comments a post has.' do
      expect(page.find_all('ul.post-comments li').count).to eq(5)
    end

    it 'See how many likes a post has.' do
      expect(page).to have_content("Likes: #{@post.likes.count}")
    end

    it 'Shows the post details when any post is clicked in the post show page' do
      click_link @post.title
      expect(page).to have_current_path(user_post_path(@firstUser, @post))
    end
  end

  # describe 'show' do
  #   before :each do
  #     # @user = User.create(name: 'Tom', photo: 'https://placeholder.com', bio: 'User\'s bio', password:'222555', email: 'tom@example.com')
  #     visit new_user_session_path
  #     fill_in 'Email', with: "tom@example.com"
  #     fill_in 'Password', with: "222555"
  #     click_button 'Log in'

  #     if @firstUser.posts.empty?
  #       @post1 = @firstUser.posts.create(title: 'Post title 1', text: 'Post text 1')
  #       @post2 = @firstUser.posts.create(title: 'Post title 2', text: 'Post text 2')
  #       @post3 = @firstUser.posts.create(title: 'Post title 3', text: 'Post text 3')
  #     else
  #       @post1 = @firstUser.posts.find(1)
  #       @post2 = @firstUser.posts.find(2)
  #       @post3 = @firstUser.posts.find(3)
  #     end
  #     click_link 'Tom'
  #   end

  #   it 'shows the correct path' do
  #     expect(page).to have_current_path(user_path(@firstUser))
  #   end

  #   it 'shows the user profile picture' do
  #     all_images = page.all('img')
  #     expect(all_images.count).to eq(1)
  #   end

  #   it 'shows the user username' do
  #     expect(page.find('h4', text: 'Tom')).to be_truthy
  #   end

  #   it 'shows the user post count' do
  #     expect(page).to have_content("Posts: #{@firstUser.posts.count}")
  #   end

  #   it 'shows the user bio' do
  #     expect(page).to have_content(@firstUser.bio)
  #   end

  #   it 'shows the user\'s first three posts' do
  #     expect(page.find_all('div', class: 'post-card').count).to eq(3)
  #   end

  #   it 'shows the user\'s posts when any post is clicked' do
  #     click_link @post1.title
  #     expect(page).to have_current_path(user_posts_path(@firstUser))
  #   end

  #   it 'shows the post details when any post is clicked in the post index page' do
  #     click_link @post1.title
  #     click_link @post1.title
  #     expect(page).to have_current_path(user_post_path(@firstUser, @post1))
  #   end
  # end
end

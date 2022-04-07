# require 'rails_helper'

# RSpec.describe 'Posts API', type: :request do
#   let!(:user) { create(:user) }
#   let!(:posts) { create_list(:post, 10, user_id: user.id) }
#   let(:post) { posts.first }

#   # Test suite for GET /posts
#   describe 'GET user/:user_id/posts' do
#     # make HTTP get request before each example
#     before { get user_posts_path(user) }

#     it 'returns posts' do
#       # Note `json` is a custom helper to parse JSON responses
#       expect(json).not_to be_empty
#       expect(json.size).to eq(10)
#     end

#     it 'returns status code 200' do
#       expect(response).to have_http_status(200)
#     end
#   end

#   # Test suite for GET /posts/:id
#   describe 'GET user/:user_id/post/:id' do
#     before { get user_post_path(user, post) }

#     context 'when the record exists' do
#       it 'returns the post' do
#         expect(json).not_to be_empty
#         expect(json['user_id']).to eq(user.id)
#         expect(json['id']).to eq(post.id)
#       end

#       it 'returns status code 200' do
#         expect(response).to have_http_status(200)
#       end
#     end

#     context 'when the record does not exist' do
#       let(:post) { {id: 100} }

#       it 'returns status code 404' do
#         expect(response).to have_http_status(404)
#       end

#       it 'returns a not found message' do
#         expect(response.body).to match(/Couldn't find Post/)
#       end
#     end
#   end

#   # Test suite for POST /posts
#   describe 'POST /posts' do
#     # valid payload
#     let(:valid_attributes) { { title: 'Learn Elm', text: 'Lorem ipsum', user_id: 1, created_at: 123, updated_at: 1233 } }

#     context 'when the request is valid' do
#       before { post users_posts_path(user), params: valid_attributes }

#       it 'creates a post' do
#         expect(json['title']).to eq('Learn Elm')
#       end

#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end
#     end

#     context 'when the request is invalid' do
#       before { post "users/#{user.id}/posts" }

#       it 'returns status code 422' do
#         expect(response).to have_http_status(422)
#       end

#       it 'returns a validation failure message' do
#         expect(response.body)
#           .to match(/Validation failed: Created at can't be blank/)
#       end
#     end
#   end
# end
# #   describe 'GET /index' do
# #     before(:example) { get '/users/:id/posts' }

# #     it 'Is response status correct' do
# #       expect(response).to have_http_status(:ok)
# #     end

# #     it 'Is correct template rendered' do
# #       expect(response).to render_template('index')
# #     end

# #     it 'Is the body includes correct text' do
# #       expect(response.body).to include('Here is a list of posts for a given user')
# #     end
# #   end

# #   describe 'GET /show' do
# #     before(:example) { get '/users/:id/posts/:id' }

# #     it 'Is response status correct' do
# #       expect(response).to have_http_status(:ok)
# #     end

# #     it 'Is correct template rendered' do
# #       expect(response).to render_template('show')
# #     end

# #     it 'Is the body includes correct text' do
# #       expect(response.body).to include('Here are the details of a given post for a given user')
# #     end
# #   end
# # end

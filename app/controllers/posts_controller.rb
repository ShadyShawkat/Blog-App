class PostsController < ApplicationController
  # load_and_authorize_resource

  def index
    @user = User.includes(:comments, :posts).find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    # new object from params
    post = current_user.posts.new(params.require(:post).permit(:title, :text))
    # respond_to block
    respond_to do |format|
      format.html do
        if post.save
          # success message
          flash[:success] = 'Post created successfully'
          # redirect to index
          redirect_to "/users/#{current_user.id}/posts"
        else
          # error message
          flash.now[:error] = 'Error: Post could not be created'
          # render new
          render :new, locals: { post: }
        end
      end
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'Post deleted successfully'
        redirect_to "/users/#{current_user.id}/posts"
      end
    end
  end
end

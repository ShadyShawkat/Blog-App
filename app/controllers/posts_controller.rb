class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    post = Post.new
    respond_to do |format|
        format.html { render :new, locals: { post: post } }
    end
  end
end

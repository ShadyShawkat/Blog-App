class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new
    @like.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @like.save
          redirect_to user_post_path(current_user, @post)
        end
      end
    end
  end
end
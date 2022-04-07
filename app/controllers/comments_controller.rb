class CommentsController < ApplicationController
  before_action :set_post, only: [:index, :create, :show, :update, :destroy]

  def index
    json_response(@post.comments)
  end

  def create
    @comment = @post.comments.create!(comment_params)
    json_response(@comment, :created)

    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.new(params.require(:comment).permit(:text))
    # @comment.user_id = current_user.id

    # respond_to do |format|
    #   format.html do
    #     if @comment.save
    #       redirect_to user_post_path(current_user, @post), notice: 'Comment created successfully!'
    #     else
    #       # error message
    #       flash.now[:error] = 'Error: Post could not be created'
    #       # render new
    #       render :new, locals: { comment: }
    #     end
    #   end
    # end
  end

  # def destroy
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  #   respond_to do |format|
  #     format.html do
  #       flash[:success] = 'Comment deleted successfully'
  #       redirect_to user_post_path(current_user.id, @post.id)
  #     end
  #   end
  # end

  private

  def comment_params
    # whitelist params
    params.permit(:text, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end

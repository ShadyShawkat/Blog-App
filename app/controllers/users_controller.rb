class UsersController < ApplicationController
  before_action :set_user, only: [:index, :create, :show, :update, :destroy]

  def index
    # @users = User.all
    json_response(User.all)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def show
    # @user = User.find(params[:id])
    json_response(@user)
  
    # if params[:id] == 'sign_out'
    #   sign_out
    #   redirect_to root_path
    # else
    #   @user = User.find(params[:id])
    # end
  end

  private

  def user_params
    parmas.permit(:name, :email, :password, :created_at, :updated_at)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

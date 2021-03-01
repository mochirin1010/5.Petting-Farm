class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
    @likes = Like.where(user_id: @user.id)
    @pets = Pet.where(user_id: @user.id)
  end
end

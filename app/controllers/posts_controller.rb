class PostsController < ApplicationController
  before_action :authenticate_user!, { only: [:new, :create, :edit, :update, :destroy] }

  def index
    @posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(20)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @pet = @post.pet
  end

  def new
    @post = Post.new
    @pets = Pet.where(user_id: current_user.id)
  end

  def create
    @pets = Pet.where(user_id: current_user.id)
    @post = Post.new(
      content: params[:content],
      image: params[:image],
      pet_id: params[:pet_id],
      user_id: current_user.id
    )
    if @post.save
      redirect_to posts_path
    else
      render new_post_path
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @post.image.cache! unless @post.image.blank?
    @pets = Pet.where(user_id: current_user.id)
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.pet_id = params[:pet_id]
    if @post.save
      redirect_to posts_path
    else
      render("posts/edit")
    end
    @pets = Pet.where(user_id: current_user.id)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.permit(:content, :image, :pet_id)
  end
end

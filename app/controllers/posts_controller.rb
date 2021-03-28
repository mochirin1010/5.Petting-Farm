class PostsController < ApplicationController
  before_action :authenticate_user!, { only: [:show, :new, :create, :edit, :update, :destroy] }
  before_action :ensure_correct_user, { only: [:edit, :update, :destroy] }

  def index
    @posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(20)
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(20)
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
    @post = Post.create(post_parameter)
    if @post.save
      redirect_to posts_path
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @post.image.cache! unless @post.image.blank?
    @pets = Pet.where(user_id: current_user.id)
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_parameter)
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

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    return unless @post.user_id != current_user.id

    redirect_to posts_path
  end

  private

  def post_parameter
    params.require(:post).permit(:content, :image, :pet_id).merge(user_id: current_user.id)
  end
end

class PetsController < ApplicationController
  before_action :authenticate_user!, { only: [:new, :create, :edit, :update, :destroy] }
  before_action :ensure_correct_user, { only: [:edit, :update, :destroy] }

  def index
    @pets = Pet.all.order(created_at: :desc)
    @pets = Pet.page(params[:page]).per(20)
    @q = Pet.ransack(params[:q])
    @pets = @q.result(distinct: true).page(params[:page]).per(20)
  end

  def show
    @pet = Pet.find_by(id: params[:id])
    @posts = Post.where(pet_id: @pet.id)
    @user = User.find_by(id: @pet.user_id)
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(
      name: params[:name],
      age: params[:age],
      pet_type: params[:pet_type],
      gender: params[:gender],
      introduction: params[:introduction],
      pet_img: params[:pet_img],
      user_id: current_user.id
    )
    if @pet.save
      redirect_to user_path(current_user)
    else
      render("pets/new")
    end
  end

  def edit
    @pet = Pet.find_by(id: params[:id])
    @pet.pet_img.cache! unless @pet.pet_img.blank?
  end

  def update
    @pet = Pet.find_by(id: params[:id])
    @pet.name = params[:name]
    @pet.age = params[:age]
    @pet.pet_type = params[:pet_type]
    @pet.gender = params[:gender]
    @pet.introduction = params[:introduction]
    @pet.pet_img = params[:pet_img] if params[:pet_img].present?
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render("pets/edit")
    end
  end

  def destroy
    @pet = Pet.find_by(id: params[:id])
    @pet.destroy
    redirect_to user_path(current_user)
  end

  def ensure_correct_user
    @pet = Pet.find_by(id: params[:id])
    return unless @pet.user_id != current_user.id

    redirect_to pets_path
  end

  private

  def pet_params
    params.permit(:name, :age, :pet_type, :gender, :introduction, :pet_img)
  end
end

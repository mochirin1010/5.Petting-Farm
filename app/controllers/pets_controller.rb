class PetsController < ApplicationController
  def index
    @pets = Pet.all.order(created_at: :desc)
    @pets = Pet.page(params[:page]).per(20)
  end

  def show
    @pet = Pet.find_by(id: params[:id])
    @posts = Post.where(pet_id: @pet.id)
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
    if params[:pet_img].present?
      @pet.pet_img = params[:pet_img]
    end
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

  private

  def pet_params
    params.permit(:name, :age, :pet_type, :gender, :introduction, :pet_img)
  end
end

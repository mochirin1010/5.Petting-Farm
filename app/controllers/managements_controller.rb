class ManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user

  def index
    @managements = Management.where(user_id: current_user.id)
  end

  def show
    @management = Management.find(params[:id])
    @pet = @management.pet
  end

  def new
    @user = User.find(params[:user_id])
    @management = Management.new
    @pets = Pet.where(user_id: current_user.id)
  end

  def create
    @pets = Pet.where(user_id: current_user.id)
    @management = Management.create(management_parameter)
    if @management.save
      redirect_to user_managements_path
    else
      render("managements/new")
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @management = Management.find(params[:id])
    @pets = Pet.where(user_id: current_user.id)
  end

  def update
    @management = Management.find(params[:id])
    if @management.update(management_parameter)
      redirect_to user_managements_path
    else
      render("managements/edit")
    end
    @pets = Pet.where(user_id: current_user.id)
  end

  def destroy
    @management = Management.find(params[:id])
    @management.destroy
    redirect_to user_managements_path
  end

  def ensure_correct_user
    @user = User.find_by(id: params[:user_id])
    return unless @user.id != current_user.id

    redirect_to root_path
  end

  private

  def management_parameter
    params.require(:management).permit(:title, :content, :start_time, :end_time, :pet_id).merge(user_id: current_user.id)
  end
end

class ManagementsController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user

  def index
    @managements = Management.all
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
    Management.create(management_parameter)
    redirect_to user_managements_path
    @pets = Pet.where(user_id: current_user.id)
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
      render "edit"
    end
    @pets = Pet.where(user_id: current_user.id)
  end

  def destroy
    @management = Management.find(params[:id])
    @management.destroy
    redirect_to user_managements_path
  end

  # def ensure_correct_user
  #   @management = Management.find_by(id: params[:id])
  #   return unless @management.user_id != current_user.id

  #   redirect_to root_path
  # end

  private

  def management_parameter
    params.require(:management).permit(:title, :content, :start_time, :pet_id).merge(user_id: current_user.id)
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

<<<<<<< HEAD
  # def after_sign_in_path_for
  #   posts_path
  # end

  # def after_sign_out_path_for
  #   new_user_session_path
  # end
=======
  def after_sign_in_path_for(_resource)
    posts_path
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end
>>>>>>> edit-pet-icon

  def after_update_path_for(resource)
    user_path(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :user_img, :introduction])
  end

  private

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end
end

class ApplicationController < ActionController::Base
     before_action :authenticate_user!, except:[:show, :top]

      before_action :configure_permitted_parameters, if: :devise_controller?
      # if: :devise_controller?というのは、deviseの画面に行った際に起動する。
      
  def after_sign_in_path_for(resource)
     user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
  
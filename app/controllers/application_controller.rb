class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :set_search

  def set_search
    @search = RoomPost.ransack(params[:q])
    @results = @search.result
    @numbers = @results.count
  end

  protect_from_forgery with: :exception
  
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end

  def after_sign_in_path_for(resource)
    root_path
  end

end


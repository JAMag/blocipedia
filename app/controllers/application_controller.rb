class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :flash_attack
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def hello
    render text: "<h1>Hello</h1><p>Welcome home</p>"
  end

  def flash_attack
    flash[:notice] = "flashy"
    flash[:error] = "not flashy"
  end
end

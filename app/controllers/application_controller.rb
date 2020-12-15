class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :validate_login


  def home
    validate_login
  end


  def current_user
    session[:name]
  end

  private

  def validate_login
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    !!session[:name]
  end
  


end

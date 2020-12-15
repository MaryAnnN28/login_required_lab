class SessionsController < ApplicationController
  
  skip_before_action :validate_login, only: [:new, :create, :destroy]

  def new 
  end

  def create
    if params[:name] && params[:name] != ""
      session[:name] = params[:name]
      flash[:success] = "Login Successful"
      redirect_to root_path
    else 
      flash[:error] = "Please enter a valid username"
      redirect_to login_path
    end
  end

  

  def destroy
    if session[:name]
      session.delete :name
    end 
    redirect_to root_path
  end



end

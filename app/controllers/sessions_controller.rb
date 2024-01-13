class SessionsController < ApplicationController
  def login
  
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to posts_path
    else
      flash.now[:warn] = "incorrect login"
      render 'login'
    end
      
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "logged out"
    redirect_to root_path
  end
end
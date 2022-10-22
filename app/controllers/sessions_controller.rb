class SessionsController < ApplicationController
  
  def new

  end

  def create
    user = User.find(email: params[:session][:email].downcase)
    if user && user.authenicate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "Incorrect email or password"
      render 'new'
    end
  end

  def delete
    session[:user_id] = nil
    flash[:notice] = "Successfuly logged out"
    redirect_to root_path
  end

end
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Looged in successfully"
      redirect_to user
    else
      #failed to loging
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end

  end

  def destroy
  end

end
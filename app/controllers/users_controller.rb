class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #byebug
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path #todo change
    else
      render 'new'
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
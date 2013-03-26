# This is the user's controller
class UsersController < ApplicationController

  # Method to create a new user
  # /signup matches to new
  def new
    @user = User.new
  end

  # This is where we show some info to the
  # user, this matches to /users/id
  # This where the user_path comes in play
  def show
    @user = User.find(params[:id])
  end

  # when user clicks the button
  def create
    @params = params[:user]
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new' 
    end
  end
end


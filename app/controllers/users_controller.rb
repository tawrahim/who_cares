# This is the user's controller
class UsersController < ApplicationController

  # Method to create a new user
  # /signup matches to new
  def new
    @user = User.new
  end

  # This is where we show some info to the
  # user, this matches to /users/id
  def show
    @user = User.find(params[:id])
  end

  # when user clicks the button
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new' 
    end
  end
end


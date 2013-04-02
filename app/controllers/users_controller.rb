# This is the user's controller
class UsersController < ApplicationController

  # before_filter runs before anything in the controller
  # so all we are saying is that, run the signed_in_user 
  # method before you hit the controller in the array
  # Reason behind checking the update is because some
  # sophisticated users might user cuRL to post data
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy

  # This action simply list all our users
  def index
    @users = User.paginate(page: params[:page])
  end

  # This is where we show some info to the
  # user, this matches to /users/id
  # This where the user_path comes in play
  def show
    @user = User.find(params[:id])
  end
  
  # Method to create a new user
  # /signup matches to new
  def new
    @user = User.new
  end


  # when user clicks the button
  def create
    @params = params[:user]
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new' 
    end
  end

  # when a user wants to edit their information
  def edit
  end

  def update
    @user = User.find(params[:id]) 
    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:success] = "Settings updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # when we want to delete a user from our database
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path 
  end

  private
     def signed_in_user
       unless signed_in?
          store_location
          redirect_to signin_path, notice: "Please sign in" 
       end
     end

     def correct_user
        # This is the user_id that we are trying to edit
        # We are using params because when the user post
        # that is the hash that we are going to get
        @user = User.find(params[:id])
        redirect_to root_path unless current_user?(@user) 
     end
    
     def admin_user
        redirect_to root_path unless current_user.admin? 
     end
end

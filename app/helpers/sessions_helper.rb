module SessionsHelper
  
  # We sign the user in by setting a remember token on their
  # browser. After we sign the user_in we want to remember them
  def sign_in(user)
    # sign the user in
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user 
  end

  # signed_in? method
  def signed_in?
   !current_user.nil? 
  end

  # We set the current user variable
  def current_user=(user)
    @current_user = user 
  end

  # We return the current user variable
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token]) 
  end

  # check if the user we are edit is indeed him
  def current_user?(user)
    user == current_user
  end

  # We set the sign out method by setting the
  # current user to nil and deleting the cookie
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  # Method to find where the user tried to visit last
  def store_location
    session[:return_to] = request.fullpath 
  end

  # Method that does the redirection
  # the session[:return_to] tells us where the user last visited
  # We also want to delete the sessions once we are done
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default) 
    session.delete(:return_to)
  end
  
  # Method to check whether signed_in or not
  def signed_in_user
    unless signed_in?
       store_location
       redirect_to signin_path, notice: "Please sign in" 
    end
  end
end

module SessionsHelper
  
  # We sign the user in by setting a remember token on their
  # browser. After we sign the user_in we want to remember them
  def sign_in(user)
    # sign the user in
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user 
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

  # We set the sign out method by setting the
  # current user to nil and deleting the cookie
  def sign_out
    current_user = nil
    cookies.delete(:remember_token)

  end
end

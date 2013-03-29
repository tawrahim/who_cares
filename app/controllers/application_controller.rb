# All the methods that we use in our controller are refrenced
# here
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
end

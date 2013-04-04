# This is the static pages controller
class StaticPagesController < ApplicationController

  # We get the current_user.microposts.build method from
  # our association
  def home
    if signed_in?
      @micropost =  current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  # Method for the about us
  def about
  end
  
  # Method for contat
  def contact
  end
end

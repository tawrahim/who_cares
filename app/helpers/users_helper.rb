module UsersHelper

  # Returns the gravatar for a given user
  def gravatar_for(user, options = {size: 50})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}?s=#{size}" 
    image_tag(gravatar_url, alt:user.name, class:"gravatar")
  end

  # Twitter style user name with the @ infront
  def twitter_style(user)
    splitter = user.email.split('@')
    "@" + splitter[0] 
  end
end

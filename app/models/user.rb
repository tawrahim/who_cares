class User < ActiveRecord::Base
  # The attr_accessible means that they can be set 
  # by mass assignment, any attribute that should
  # be web editable should be in this field
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  # This is a hook method or sometimes refered to as callback
  # methods, this gets called when an event is triggered
  # before_save call back or hook would get executed before
  # an active record object is saved
  before_save { |user| user.email = user.email.downcase }
  before_save :hello
  
  # If you dont understand what call backs are, this method
  # would demonstrate it to you, basically a hello message
  # is printed before the active record object is saved
  def hello
    puts "Hello"
  end

  # The validates method, presence makes
  # sure that the following fields are not left out blank
  # These things are sort of like the table's properties
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+@\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end

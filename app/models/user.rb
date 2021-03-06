class User < ActiveRecord::Base
  # The attr_accessible means that they can be set 
  # by mass assignment, any attribute that should
  # be web editable should be in this field
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  # The dependent:destroy means delete the micropost when you
  # delete the user from the database
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", 
                                  class_name: "Relationship",
                                  dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower


  # This is a hook method or sometimes refered to as callback
  # methods, this gets called when an event is triggered
  # before_save call back or hook would get executed before
  # an active record object is saved
  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token
#  before_save :hello

  def following?(other_user)
    self.relationships.find_by_followed_id(other_user.id)    
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    self.relationships.find_by_followed_id(other_user.id).destroy 
  end

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

  # The user feed method
  def feed
    Micropost.where("user_id = ?", id)
  end

  # We want to make the remember_token method private because we want
  # it to be accesed only in this class
  private
    def create_remember_token
      # Since this is the User class we could access user with the self
      self.remember_token = SecureRandom.urlsafe_base64 
    end
end

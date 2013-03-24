class User < ActiveRecord::Base
  # The attr_accessible means that they can be set 
  # by mass assignment, any attribute that should
  # be web editable should be in this field
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = user.email.downcase }

  # The validates method, presence makes
  # sure that the following fields are not left out blank
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+@\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end

class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140}

  # basically what the default scope method does is that, it is
  # a way that we want our database to be returned back to us
  # In plain words we are setting up a default scope for all our
  # operations on this database
  default_scope order: 'microposts.created_at DESC'
end

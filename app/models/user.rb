class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :comments
  has_many :activities
  has_many :attendees
  has_many :activity_attending, through: :attendees, source: :activity
  validates :fname, :lname, :location, presence: true
  validates :password, length: {minimum: 8}, presence: true, on: :create
  validates :state, presence: true, length: {is:2}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  
end

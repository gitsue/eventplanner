class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :attendees
  has_many :user_participated, through: :attendees, source: :user
  validates :name, :date, :location, presence: true
  validate :event_future_date

  def event_future_date
  	errors.add(:date, "can't be in the past!") if 
  	!date.blank? and date < Date.today
  end
end

class Reservation < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  # validates :people, numericality => { :only_integer => true, :greater_than => 0, :less_than => 500 }
  validate :restaurant_must_be_within_capacity

  belongs_to :user
  belongs_to :restaurant

  def restaurant_must_be_within_capacity
    unless self.restaurant.is_available?(self.start_time, self.people)
      errors.add(:start_time, "is not available for ") + pluralize(self.people, "person")
    end
  end

end

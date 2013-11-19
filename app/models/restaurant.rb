class Restaurant < ActiveRecord::Base

  has_many :reservations
  has_many :users, through: :reservations
  has_one :category

  validates :capacity, presence: true
   
  def availability?(reservation)
    peeps = 0
    self.reservations.
      where(start_time: reservation.start_time).
      each { |r| peeps += r.people }
    (peeps + reservation.people) < capacity
  end

end

#self.reservations.all is replaced with self.reservations.where
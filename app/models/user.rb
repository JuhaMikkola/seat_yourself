class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  has_many :reservations
  has_many :reviews
  has_many :restaurants, through: :reservations


  #demo has 'has_many: :reservations'

end

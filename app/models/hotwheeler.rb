class Hotwheeler < ActiveRecord::Base
  has_secure_password
  validates :name, :username, :password, :age, presence: true
  validates :username, :name, uniqueness: true
  has_many :cars
end

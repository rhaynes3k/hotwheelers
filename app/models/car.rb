class Car < ActiveRecord::Base

  belongs_to :hotwheeler
  validates :year, :make, :model, :color, :rank, presence: true

  # has_secure_password
end

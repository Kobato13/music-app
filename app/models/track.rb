class Track < ApplicationRecord

  validates :name, presence: true

  has_one_attached :sound
  
end

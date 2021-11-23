class Artist < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_one_attached :avatar
end

class Album < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_one_attached :avatar
end

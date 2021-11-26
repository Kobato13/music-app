class Album < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_one_attached :cover_art_url
end

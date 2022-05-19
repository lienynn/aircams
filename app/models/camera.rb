class Camera < ApplicationRecord
  belongs_to :user
  has_many :rentals

  validates :model, presence: true
  validates :price_per_day, presence: true
  validates :address, presence: true, uniqueness: true
  validates :details, presence: true, length: { minimum: 20 }

  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

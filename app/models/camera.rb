class Camera < ApplicationRecord
  belongs_to :user
  has_many :rentals

  validates :model, presence: true
  validates :price_per_day, presence: true
  validates :zip_code, presence: true
  validates :details, presence: true, length: { minimum: 20 }
end

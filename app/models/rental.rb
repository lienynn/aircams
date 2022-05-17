class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :camera

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }
end

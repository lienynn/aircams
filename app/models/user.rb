class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rentals
  has_many :cameras
  has_many :owner_rentals, through: :cameras, source: :rentals

  validates :email, presence: true
  validates :password, presence: true
end

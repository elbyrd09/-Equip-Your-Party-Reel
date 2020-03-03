class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :pictures, through: :items
  has_many :rentals
  has_many :reviews, through: :rentals

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
end

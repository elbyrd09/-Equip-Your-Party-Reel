class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :pictures, through: :items
  has_many :rentals
  has_many :reviews, through: :rentals

  validates :first_name, length: { minimum: 2 }, format: { with:  /\A[a-zA-Z]+\z/ }, presence: true
  validates :last_name, length: { minimum: 2 }, format: { with:  /\A[a-zA-Z|\s]+\z/ }, presence:  true
  validates :location, presence: true

end

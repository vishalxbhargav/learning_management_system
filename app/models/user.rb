class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include Imageable
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :reviews

  # validates :username, uniqueness: true, length: { minimum: 6 }, on: :create
  # validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP, on: :create
  # validates :password, presence: true, confirmation: true, length: { minimum: 6, maximum: 40 }, on: :create
  # validates :password_confirmation, presence: true
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
end

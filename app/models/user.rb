class User < ApplicationRecord
  include Imageable
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :reviews

  validates :username, uniqueness: true, length: { minimum: 6 }
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP
  validates :password, presence: true, confirmation: true, length: { minimum: 6, maximum: 40 }
  validates :password_confirmation, presence: true
end

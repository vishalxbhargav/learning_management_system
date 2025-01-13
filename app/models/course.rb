class Course < ApplicationRecord
  include Imageable
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :reviews
  has_many :chapters
  belongs_to :category, class_name: "Category", optional: true
end

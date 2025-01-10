class Course < ApplicationRecord
  include Imageable
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :reviews
  has_one :categories, class_name: "Category", foreign_key: "category_id"
end

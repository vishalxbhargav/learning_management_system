class Review < ApplicationRecord
  has_many :pictures, as: :imageable
  belongs_to :user
  belongs_to :course

  enum :status, [ :not_published, :published, :hidden ]
end

class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user
  enum :status, [ :enrolled, :completed, :cencelled ]
end

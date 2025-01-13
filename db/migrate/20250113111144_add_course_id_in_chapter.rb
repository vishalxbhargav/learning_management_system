class AddCourseIdInChapter < ActiveRecord::Migration[8.0]
  def change
    add_reference :courses, :course, foreign_key: true
  end
end

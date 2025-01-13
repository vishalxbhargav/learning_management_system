class AddCourseIdToCategories < ActiveRecord::Migration[8.0]
  def change
    add_reference :categories, :course, foreign_key: true
  end
end

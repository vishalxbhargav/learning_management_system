class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :duration
      t.decimal :price

      t.timestamps
    end
  end
end

class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollments do |t|
      t.references :course, null: false, foreign_key: { to_table: :courses }
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.integer :status
      t.timestamps
    end
  end
end

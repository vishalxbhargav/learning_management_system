class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :contenet
      t.integer :status
      t.references :course, null: false, foreign_key: { to_table: :courses }
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end

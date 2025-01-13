class CreateChatpers < ActiveRecord::Migration[8.0]
  def change
    create_table :chapters do |t|
      t.string :name
      t.references :course, foreign_key: { to_table: :courses }
      t.timestamps
    end
  end
end

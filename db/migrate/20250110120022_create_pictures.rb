class CreatePictures < ActiveRecord::Migration[8.0]
  def change
    create_table :pictures do |t|
      t.string :url
      t.belongs_to :imageable, polymorphic: true
      t.timestamps
    end
  end
end

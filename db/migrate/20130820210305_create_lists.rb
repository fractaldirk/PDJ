class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :artist
      t.integer :list_id

      t.timestamps
    end
  end
end

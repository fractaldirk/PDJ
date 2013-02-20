class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :painter
      t.integer :painter_id

      t.timestamps
    end
  end
end

class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :name
      t.string :artist
      t.text :message
      t.string :promoter

      t.timestamps
    end
  end
end

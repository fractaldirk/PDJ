class AddInfoToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :indicator, :integer
    add_column :promotions, :wall_post, :boolean
  end
end

class AddRefToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :ref, :integer
  end
end

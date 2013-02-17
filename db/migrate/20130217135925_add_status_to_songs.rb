class AddStatusToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :status, :integer
  end
end

class AddDetailzToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :points, :integer
    add_column :songs, :user_name, :string
    add_column :songs, :user_fb, :integer
  end
end

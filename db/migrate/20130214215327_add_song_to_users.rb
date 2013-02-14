class AddSongToUsers < ActiveRecord::Migration
  def change
    add_column :users, :song, :string
  end
end

class AddDetailsToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :external_link, :string
    add_column :paintings, :promotion, :boolean
    add_column :paintings, :song_name, :string
    add_column :paintings, :song_artist, :string
  end
end

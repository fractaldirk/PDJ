class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :username, :string
    add_column :users, :gender, :string
  end
end

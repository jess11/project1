class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :text
    add_column :users, :image, :text
    add_column :users, :location, :text
    add_column :users, :password_digest, :string
  end
end

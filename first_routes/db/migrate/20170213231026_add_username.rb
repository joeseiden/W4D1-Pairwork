class AddUsername < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, unique: true
    remove_column :users, :name
    remove_column :users, :email
  end
end

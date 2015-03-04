class ChangeUsernameToUsers < ActiveRecord::Migration

  def self.up
    remove_column :users, :first_name
    remove_column :users, :last_name
    add_column    :users, :name, :string
    add_index     :users, :name, unique: true
  end

  def self.down
    add_column    :users, :first_name
    add_column    :users, :last_name
    remove_column :users, :name, :string
    remove_index  :users, :slug
  end

end

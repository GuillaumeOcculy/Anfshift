class ChangeDescriptionFormatInShift < ActiveRecord::Migration
  def self.up
    change_column :shifts, :description, :text
  end

  def self.down
    change_column :shifts, :description, :string
  end
end

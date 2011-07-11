class AddUserToCall < ActiveRecord::Migration
  def self.up
    add_column :calls, :user_id, :integer
  end

  def self.down
    remove_column :calls, :user_id
  end
end

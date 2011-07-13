class AddPostedAtToCall < ActiveRecord::Migration
  def self.up
    add_column :calls, :posted_at, :datetime
  end

  def self.down
    remove_column :calls, :posted_at
  end
end

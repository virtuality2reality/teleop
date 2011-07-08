class AddRequiredToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :required, :boolean
  end

  def self.down
    remove_column :question, :required
  end
end

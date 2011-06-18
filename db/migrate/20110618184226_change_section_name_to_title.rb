class ChangeSectionNameToTitle < ActiveRecord::Migration
  def self.up
    rename_column :sections, :name, :title
  end

  def self.down
    rename_column :sections, :title, :name
  end
end

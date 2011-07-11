class CreateDependencies < ActiveRecord::Migration
  def self.up
    create_table :dependencies do |t|
      t.integer :question_id
      t.integer :choice_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dependencies
  end
end

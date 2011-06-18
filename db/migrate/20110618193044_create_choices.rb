class CreateChoices < ActiveRecord::Migration
  def self.up
    create_table :choices do |t|
      t.integer :question_id
      t.string :ext_id
      t.string :title
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :choices
  end
end

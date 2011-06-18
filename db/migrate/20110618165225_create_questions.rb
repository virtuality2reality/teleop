class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :ext_id
      t.string :typ
      t.string :title
      t.integer :position
      t.integer :section_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end

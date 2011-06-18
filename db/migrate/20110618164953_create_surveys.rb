class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.string :ext_id
      t.string :title
      t.integer :client_id

      t.timestamps
    end
  end

  def self.down
    drop_table :surveys
  end
end

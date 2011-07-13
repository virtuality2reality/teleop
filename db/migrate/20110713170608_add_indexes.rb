class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :answers, :question_id
    add_index :answers, :choice_id
    add_index :answers, :call_id
    
    add_index :calls, :survey_id
    add_index :calls, :user_id
    
    add_index :choices, :question_id
    
    add_index :dependencies, :question_id
    add_index :dependencies, :choice_id

    add_index :questions, :section_id
    
    add_index :roles_users, :role_id
    add_index :roles_users, :user_id
    
    add_index :sections, :survey_id
    
    add_index :surveys, :client_id
  end

  def self.down
    remove_index :answers, :question_id
    remove_index :answers, :choice_id
    remove_index :answers, :call_id

    remove_index :calls, :survey_id
    remove_index :calls, :user_id

    remove_index :choices, :question_id

    remove_index :dependencies, :question_id
    remove_index :dependencies, :choice_id

    remove_index :questions, :section_id

    remove_index :roles_users, :role_id
    remove_index :roles_users, :user_id

    remove_index :sections, :survey_id

    remove_index :surveys, :client_id
  end
end

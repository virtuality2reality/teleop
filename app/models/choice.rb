class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :dependencies
  has_many :dependent_questions, :through => :dependencies, :source => :question
  
  validates_presence_of :title
  
  def full_title
    title + (ext_id.blank? ? "" : " [#{ext_id}]")
  end
end

class Answer < ActiveRecord::Base
  belongs_to :call, :inverse_of => :answers
  belongs_to :question
  belongs_to :choice
  
  validates_presence_of :call
  validates_presence_of :question
  validates_presence_of :body, :if => :open?
  validates_presence_of :choice, :unless => :open?
  
  def open?
    question.open?
  end
  
end

class Answer < ActiveRecord::Base
  belongs_to :call, :inverse_of => :answers
  belongs_to :question
  belongs_to :choice
  
  validates_presence_of :call
  validates_presence_of :question
  validates_presence_of :body, :if => :should_validate_body
  validates_presence_of :choice_id, :if => :should_validate_choice
  
  def open?
    question.open?
  end
  
  def required?
    question.required?
  end
  
  def not_required_and_invalid?
    !required? && body.blank? && choice_id.blank?
  end
  
  private
  def should_validate_body
    open? && required?
  end
  
  def should_validate_choice
    !open? && required?
  end
  
end

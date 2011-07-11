class Call < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, :dependent => :destroy, :inverse_of => :call
  accepts_nested_attributes_for :answers, :allow_destroy => true
  has_one :client, :through => :survey
  belongs_to :user
  
  validates_presence_of :survey
  
  validate :required_questions
  
  default_scope order("created_at DESC")
  
  def representation
    I18n.l(created_at)
  end
  
  def answers_by_section
    result = {}
    survey.sections.each do |s|
      result[s.title] ||= []
      s.questions.each do |q|
        a = answer_for_question(q) || answers.build(:question => q)
        result[s.title] << a
      end
    end
    result
  end
  
  def answer_for_question(q)
    answers.each do |a|
      return a if a.question == q
    end
    nil
  end
  
  def dependency_met_for?(answer)
    return true if answer.question.depending_choices.size == 0
    answer.question.depending_choices.each do |dc|
      answers.each do |a|
        if (a.choices?)
          return true if a.choice == dc
        end
      end
    end
    false
  end

  private  
  def required_questions
    survey.questions.each do |q|
      a = answer_for_question(q)
      if a && (a.not_required_and_invalid?)
        answers.delete(a)
      end
    end
  end
  
end

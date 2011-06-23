class Call < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, :dependent => :destroy, :inverse_of => :call
  accepts_nested_attributes_for :answers, :allow_destroy => true, :reject_if => lambda { |me| me[:body].blank? && me[:choice_id].blank? }
  has_one :client, :through => :survey
  
  validates_presence_of :survey
  
  default_scope order("created_at DESC")
  
  def representation
    I18n.l(created_at)
  end
  
  def answers_by_section
    result = {}
    section = nil
    answers.each do |a|
      section = a.question.section if section != a.question.section
      result[section.title] ||= []
      result[section.title] << a
    end
    result
  end
  
end

class Question < ActiveRecord::Base
  TYPES = %w{ open choices }
  
  belongs_to :section
  has_many :choices, :dependent => :destroy, :order => "position ASC"
  accepts_nested_attributes_for :choices, :allow_destroy => true, :reject_if => lambda { |me| me[:title].blank? }
  has_many :dependencies
  has_many :depending_choices, :through => :dependencies, :source => :choice
  
  validates_inclusion_of :typ, :in => TYPES
  validates_presence_of :title
  
  def open?
    typ == "open"
  end
  
  def choices?
    typ == "choices"
  end
  
  def full_title
    title + (required? ? "*" : "") + (ext_id.blank? ? "" : " [#{ext_id}]")
  end
  
  def has_dependency?
    depending_choices.size > 0
  end
  
end

class Question < ActiveRecord::Base
  TYPES = %w{ open choices }
  
  belongs_to :section
  has_many :choices, :dependent => :destroy, :order => "position ASC"
  accepts_nested_attributes_for :choices, :allow_destroy => true, :reject_if => lambda { |me| me[:title].blank? }
  
  validates_inclusion_of :typ, :in => TYPES
  validates_presence_of :title
  
  def open?
    typ == "open"
  end
end

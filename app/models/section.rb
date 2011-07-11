class Section < ActiveRecord::Base
  belongs_to :survey, :inverse_of => :sections
  has_many :questions, :dependent => :destroy, :order => "position ASC"
  accepts_nested_attributes_for :questions, :allow_destroy => true, :reject_if => lambda { |me| me[:title].blank? }
  
  validates_presence_of :survey
  validates_presence_of :title
  
end

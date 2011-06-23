class Survey < ActiveRecord::Base
  belongs_to :client
  has_many :sections, :dependent => :destroy, :inverse_of => :survey, :order => "position ASC"
  accepts_nested_attributes_for :sections, :allow_destroy => true, :reject_if => lambda { |me| me[:title].blank? }
  has_many :calls, :dependent => :destroy
  
  validates_presence_of :title
  
  def representation
    title
  end
end

class Survey < ActiveRecord::Base
  belongs_to :client
  has_many :sections, :dependent => :destroy
  accepts_nested_attributes_for :sections, :allow_destroy => true, :reject_if => lambda { |me| me[:title].blank? }
  
  validates_presence_of :title
end

class Client < ActiveRecord::Base
  has_many :surveys, :dependent => :destroy
  has_many :calls, :through => :surveys
  
  validates_presence_of :name
  
  def representation
    name
  end
end

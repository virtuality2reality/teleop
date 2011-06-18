class Client < ActiveRecord::Base
  has_many :surveys, :dependent => :destroy
  
  validates_presence_of :name
end

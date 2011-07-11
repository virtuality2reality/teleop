class Dependency < ActiveRecord::Base
  belongs_to :question
  belongs_to :choice
end

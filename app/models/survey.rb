class Survey < ActiveRecord::Base
  belongs_to :client
  has_many :sections, :dependent => :destroy, :inverse_of => :survey, :order => "position ASC"
  accepts_nested_attributes_for :sections, :allow_destroy => true, :reject_if => lambda { |me| me[:title].blank? }
  has_many :calls, :dependent => :destroy
  has_many :questions, :through => :sections
  
  validates_presence_of :title
  
  def representation
    title
  end
  
  def select_options
    options = []
    sections.each do |s|
      options << [ s.title, [ ] ]
      next if s.questions.nil?
      s.questions.each do |q|
        if q.open?
          next
        end
        options << [
          "&nbsp;&nbsp;#{q.title}".html_safe,
          q.choices.map do |c|
            [ "&nbsp;&nbsp;&nbsp;&nbsp;#{c.title}".html_safe, c.id ]
          end
        ]
      end
    end
    options
  end
end

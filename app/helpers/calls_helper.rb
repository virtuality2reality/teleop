module CallsHelper
  def answers_for(f)
    answers_by_section = []
    section = nil
    f.fields_for :answers do |builder|
      if builder.object.question.section != section
        section = builder.object.question.section
      end
      i = answers_by_section.index { |s| s[:section] == section.title }
      if i.nil?
        answers_by_section << { :section => section.title, :answers => [] }
        i = answers_by_section.length - 1
      end
      answers_by_section[i][:answers] << render('answer_fields', :f => builder)
    end
    answers_by_section
  end
end

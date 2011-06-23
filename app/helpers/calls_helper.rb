module CallsHelper
  def answers_for(f)
    answers = {}
    section = nil
    f.fields_for :answers do |builder|
      if builder.object.question.section != section
        section = builder.object.question.section
      end
      answers[section.title] ||= []
      answers[section.title] << render('answer_fields', :f => builder)
    end
    answers
  end
end

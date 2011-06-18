module ApplicationHelper
  
  def link_to_add_fields(name, f, association, options = {})
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", options.merge(:f => builder))
    end
    selector = options.delete(:selector)
    link_to_function(name, "teleop.add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\", \"#{selector}\")")
  end
  
  def link_to_remove_fields(name, f, options = {})
    selector = options[:selector] || "fieldset"
    f.hidden_field(:_destroy) + link_to_function(name, "teleop.remove_fields(this, \"#{selector}\")")
  end
  
end

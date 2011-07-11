module BreadcrumbsOnRails
  
  module Breadcrumbs

    class CustomBuilder < Builder

      def render
        @elements.enum_for(:each_with_index).collect do |element, index|
          render_element(element, index == @elements.size - 1)
        end.join(@options[:separator] || " &raquo; ")
      end

      def render_element(element, is_last)
        # Only last element is not a link
        content = is_last ? compute_name(element) : @context.link_to(compute_name(element), compute_path(element))
        # content = @context.link_to_unless_current(compute_name(element), compute_path(element))
        if @options[:tag]
          @context.content_tag(@options[:tag], content)
        else
          content
        end
      end

    end

  end

end

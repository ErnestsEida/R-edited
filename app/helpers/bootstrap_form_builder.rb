def errors_block(attribute, feedback_name)
  return if @object.errors[attribute].empty?

  @template.tag.div(class: 'invalid-feedback', id: feedback_name) do
    @template.tag.ul do
      @object.errors[attribute].map do |error_message|
        @template.tag.li(error_message)
      end.join('').html_safe
    end
  end
end

class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  %w[text_field text_area file_field].each do |method_name|
    define_method(method_name) do |attribute, options = {}|
      feedback_name = "#{@object_name}-#{attribute.to_s}-feedback"
      options["aria-describedby"] = feedback_name
      options[:class] = "#{options[:class]} form-control"
      unless @object[attribute].nil?
        options[:class] += (@object.errors[attribute].any? ? ' is-invalid' : ' is-valid')
      end

      @template.tag.div(class: 'form-group') do
        label(attribute, class: 'form-label') + super(attribute, options) +

        if @object.errors[attribute].any?
          errors_block(attribute, feedback_name)
        end

      end

    end
  end
end

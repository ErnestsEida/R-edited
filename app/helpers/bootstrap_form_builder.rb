class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  %w[text_field text_area file_field].each do |method_name|
    define_method(method_name) do |attribute, options = {}|
      feedback_name = @object_name + '-' + attribute.to_s + '-feedback'
      options["aria-describedby"] = feedback_name
      options[:class] = options[:class].present? ? "#{options[:class]} form-control" : 'form-control'
      unless @object[attribute].nil?
        options[:class] += (@object.errors[attribute].any? ? ' is-invalid' : ' is-valid')
      end

      @template.content_tag :div, class: 'form-group' do
        label(attribute, class: 'form-label') + super(attribute, options) +
          @template.content_tag(:div, class: 'invalid-feedback', id: feedback_name) do
            @template.content_tag(:ul) do
              @template.content_tag(:li, @object.errors[attribute].join(' and '))
            end
          end
      end
    end
  end
end

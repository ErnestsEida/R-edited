class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options = {})
    options[:class] = options[:class].present? ? "#{options[:class]} form-control" : 'form-control'
    unless @object[attribute].nil?
      options[:class] += (@object.errors[attribute].any? ? ' is-invalid' : ' is-valid')
    end
    super(attribute, options)
  end

  def text_area(attribute, options = {})
    options[:class] = options[:class].present? ? "#{options[:class]} form-control" : 'form-control'
    unless @object[attribute].nil?
      options[:class] += (@object.errors[attribute].any? ? ' is-invalid' : ' is-valid')
    end
    super(attribute, options)
  end

  def file_field(attribute, options = {})
    options[:class] = options[:class].present? ? "#{options[:class]} form-control" : 'form-control'
    unless @object[attribute].nil?
      options[:class] += (@object.errors[attribute].any? ? ' is-invalid' : ' is-valid')
    end
    super(attribute, options)
  end
end

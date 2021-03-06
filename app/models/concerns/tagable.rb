module Tagable
  extend ActiveSupport::Concern

  def tags=(json)
    self.tag_references.destroy_all
    return if json.blank?

    tags_params = JSON.parse(json)
    tags_params.each do |tag_param|
      tag = Tag.find_or_create_by(title: tag_param['value'])
      self.tag_references.find_or_initialize_by(tag: tag)
    end
  end

  def tags_as_json
    tag_references.map do |reference|
      { value: reference.tag.title }
    end.to_json
  end
end

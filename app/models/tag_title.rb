class TagTitle < ApplicationRecord
  belongs_to :tags, polymorphic: true
end

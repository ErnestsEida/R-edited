class TagReference < ApplicationRecord
  belongs_to :tagable, polymorphic: true
  belongs_to :tag
end

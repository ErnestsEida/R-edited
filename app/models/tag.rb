class Tag < ApplicationRecord
  belongs_to :tagable, polymorphic: true
end

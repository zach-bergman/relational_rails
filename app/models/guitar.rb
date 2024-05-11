class Guitar < ApplicationRecord
  # validates_presense_of :name
  # validates_presense_of :used
  # validates_presense_of :price

  belongs_to :store
end
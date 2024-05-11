class Guitar < ApplicationRecord
  # validates_presense_of :name
  # validates_presense_of :used
  # validates_presense_of :price

  belongs_to :store

  def self.display_used_guitars
    where(used: true)
  end
end
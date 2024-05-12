class Guitar < ApplicationRecord
  # validates_presense_of :name
  # validates_presense_of :used
  # validates_presense_of :price

  belongs_to :store

  def self.display_used_guitars
    where(used: true)
  end

  def self.sort_by_name
    order(:name)
  end

  def self.show_guitars_over_price(user_price)
    where("price > #{user_price}")
  end
end
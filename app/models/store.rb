class Store < ApplicationRecord
  has_many :guitars

  # validates :name, presence: true

  def self.sort_by_created_at
    order(created_at: :DESC)
  end

  def guitar_count
    guitars.count
  end

  def self.sort_by_largest_inventory
    all.sort_by do |store| 
      store.guitar_count 
    end.reverse
  end
end
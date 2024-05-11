class Store < ApplicationRecord
  has_many :guitars

  # validates :name, presence: true

  def self.sort_by_created_at
    order(created_at: :DESC)
  end
end
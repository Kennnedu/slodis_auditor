class Inventory < ApplicationRecord
  enum status: %i[inactive active]

  has_many :products, dependent: :destroy
end

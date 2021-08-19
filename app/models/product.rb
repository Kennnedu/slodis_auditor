class Product < ApplicationRecord
  validates :barcode, :amount, presence: true
end

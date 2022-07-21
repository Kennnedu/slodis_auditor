class Product < ApplicationRecord
  belongs_to :inventory
  belongs_to :auditor
  belongs_to :product_kind

  delegate :barcode, :barcode_image, to: :product_kind, allow_nil: true

  validates :amount, :barcode, presence: true

  def amount_formatted
    amount % 1 === 0 ? amount.to_i : amount
  end

  def barcode=(barcode)
    self.product_kind = ProductKind.find_or_create_by(barcode: barcode)
  end
end

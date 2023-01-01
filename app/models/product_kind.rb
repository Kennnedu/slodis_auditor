class ProductKind < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :barcode, presence: true, uniqueness: true

  before_create :set_barcode_image

  def set_barcode_image
    barby_barcode = Barby::Code128B.new(barcode)
    self.barcode_image = "data:image/png;base64,#{Base64.encode64(Barby::RmagickOutputter.new(barby_barcode).to_png)}"
  end
end

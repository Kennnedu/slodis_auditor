class AddBarcodeImageToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :barcode_image, :text, default: ''
  end
end

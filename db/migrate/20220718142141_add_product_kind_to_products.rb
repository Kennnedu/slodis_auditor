class AddProductKindToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :product_kind, null: false, foreign_key: true
    remove_column :products, :barcode, :string
    remove_column :products, :barcode_image, :text
  end
end

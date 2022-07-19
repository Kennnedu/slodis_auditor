class CreateProductKinds < ActiveRecord::Migration[6.1]
  def change
    create_table :product_kinds do |t|
      t.string :barcode
      t.text :barcode_image

      t.timestamps
    end
  end
end

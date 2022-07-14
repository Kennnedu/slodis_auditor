class AddInventoryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :inventory, foreign_key: true
  end
end

class AddAuditorToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :auditor, null: false, foreign_key: true
  end
end

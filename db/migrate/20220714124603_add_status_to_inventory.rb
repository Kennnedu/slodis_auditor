class AddStatusToInventory < ActiveRecord::Migration[6.1]
  def change
    add_column :inventories, :status, :integer, null: false, default: 0
  end
end

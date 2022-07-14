ActiveAdmin.register Product do
  filter :barcode
  filter :amount
  filter :inventory, as: :select, collection: proc { Inventory.order(created_at: :desc).pluck(:id) }

  csv do
    column :barcode
    column :amount
  end

  controller do
    def scoped_collection
      super.includes(:inventory)
    end
  end

  index do
    selectable_column
    column :inventory
    column :barcode
    column :amount
    column :created_at
    actions
  end

  permit_params :barcode, :amount, :inventory_id

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :inventory, as: :select, collection: Inventory.order(created_at: :desc).pluck(:id)
      f.input :barcode
      f.input :amount
    end
    f.actions
  end
end

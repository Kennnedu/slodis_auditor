ActiveAdmin.register Product do
  filter :inventory, as: :select, collection: proc { Inventory.all.order(created_at: :desc).pluck(:id) }
  filter :auditor
  filter :barcode
  filter :amount
  filter :created_at

  csv do
    column(:auditor) { |p| p.auditor.name }
    column :barcode
    column :amount
  end

  controller do
    def scoped_collection
      super.includes(:inventory, :auditor)
    end
  end

  index do
    selectable_column
    column(:inventory) { |p| p.inventory.id }
    column(:auditor) { |p| p.auditor.name }
    column :barcode
    column :amount
    column :created_at
    actions
  end

  permit_params :barcode, :amount, :inventory_id, :auditor_id

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :inventory, as: :select, collection: Inventory.order(created_at: :desc).pluck(:id)
      f.input :auditor, as: :select, collection: Auditor.order(created_at: :desc).pluck(:name, :id)
      f.input :barcode
      f.input :amount
    end
    f.actions
  end
end

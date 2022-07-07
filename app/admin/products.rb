ActiveAdmin.register Product do
  filter :barcode
  filter :amount

  csv do
    column :barcode
    column :amount
  end

  index do
    selectable_column
    column :barcode
    column :amount
    column :created_at
    actions
  end

  permit_params :barcode, :amount

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :barcode
      f.input :amount
    end
    f.actions
  end
end

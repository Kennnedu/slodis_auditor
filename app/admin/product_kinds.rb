ActiveAdmin.register ProductKind do
  filter :barcode

  index do
    column :barcode
    actions defaults: false do |pk|
      a I18n.t('active_admin.view'), href: admin_product_kind_path(pk), class: "view_link member_link"
      a I18n.t('active_admin.edit'), href: edit_admin_product_kind_path(pk), class: "edit_link member_link"
    end
  end

  permit_params :barcode

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :barcode
    end
    f.actions
  end

  show do
    attributes_table do
      row :barcode
      row :barcode_image do |pk|
        img src: pk.barcode_image, height: 100, width: 200
      end
      row :created_at
      row :updated_at
    end
#    active_admin_comments
  end
end

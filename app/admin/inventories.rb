ActiveAdmin.register Inventory do
  menu priority: 2
  scope('All') { |scope| scope.all }
  scope('Active') { |scope| scope.active }
  scope('Inactive') { |scope| scope.inactive }

  filter :description
  filter :created_at

  permit_params :description, :status

  index do
    id_column
    column(:status) { |i| status_tag(i.status) }
    column :created_at
    actions defaults: false do |inventory|
      a I18n.t('active_admin.view'), href: admin_inventory_path(inventory), class: "view_link member_link"
      a I18n.t('active_admin.edit'), href: edit_admin_inventory_path(inventory), class: "edit_link member_link"
      a I18n.t('listings.show.title'), href: listing_path(inventory.id), class: "edit_link member_link",
        target: '_blank'
      a "#{I18n.t('listings.show.title')} PDF", href: listing_path(inventory.id, format: :pdf), class: "edit_link member_link",
        target: '_blank'
    end
  end

  show do
    attributes_table do
      row :id
      row(:status) { |i| status_tag(i.status) }
      row :description
      row :created_at
    end
#    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :status
      f.input :description
    end
    f.actions
  end
end

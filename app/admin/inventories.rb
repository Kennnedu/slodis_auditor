ActiveAdmin.register Inventory do
  permit_params :description

  index do
    column :id do |inventory|
      link_to inventory.id, admin_inventory_path(inventory)
    end
    column :description
    column :created_at
    column :updated_at
  end

  show do
    attributes_table do
      row :id
      row :description
      row :created_at
      row :links do |inventory|
        ul do
          li do
            a t('products.listing.title'), href: listing_inventory_products_path(inventory), target: '_blank'
          end
          li do
            a t('products.index.title'), href: inventory_products_path(inventory), target: '_blank'
          end
        end
      end
    end
#    active_admin_comments
  end
end

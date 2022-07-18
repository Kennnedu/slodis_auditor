ActiveAdmin.register Auditor do
  filter :name

  permit_params :name

  index do
    column :name
    actions defaults: false do |auditor|
      a I18n.t('active_admin.view'), href: admin_auditor_path(auditor), class: "view_link member_link"
      a I18n.t('active_admin.edit'), href: edit_admin_auditor_path(auditor), class: "edit_link member_link"
    end
  end

  show do
    attributes_table do
      row :name
      row :token
      row :created_at
      row :updated_at
      row ' ' do |auditor|
        a I18n.t('.auth_link'), href: session_path(token: auditor.token, locale: :ru)
      end
    end
#    active_admin_comments
  end
end

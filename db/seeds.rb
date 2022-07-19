require 'csv'

PRODUCTS_CSV_FILE = './db/products.csv'

AdminUser.create!(email: Rails.application.credentials.super_admin_email,
                  password: Rails.application.credentials.super_admin_pass,
                  password_confirmation: Rails.application.credentials.super_admin_pass)

inventory = Inventory.active.create!
auditor = Auditor.create!(name: Faker::JapaneseMedia::Naruto.character)

rows = CSV.table(PRODUCTS_CSV_FILE)

rows.each do |row|
  Product.create!({ inventory: inventory, auditor: auditor }.merge(row.to_hash))
end

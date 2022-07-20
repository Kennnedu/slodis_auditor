PRODUCTS_JSON_FILE = './db/products.json'

AdminUser.create!(email: Rails.application.credentials.super_admin_email,
                  password: Rails.application.credentials.super_admin_pass,
                  password_confirmation: Rails.application.credentials.super_admin_pass)

inventory = Inventory.active.create!
auditor = Auditor.create!(name: Faker::JapaneseMedia::Naruto.character)

products = JSON.parse(File.read(PRODUCTS_JSON_FILE))

products.each do |product|
  Product.create!({ inventory: inventory, auditor: auditor }.merge(product))
end

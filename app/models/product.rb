require 'csv'

class Product < ApplicationRecord
  validates :barcode, :amount, presence: true

  def self.to_csv
    attributes = %w{barcode amount}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def amount_formatted
    amount % 1 === 0 ? amount.to_i : amount
  end
end

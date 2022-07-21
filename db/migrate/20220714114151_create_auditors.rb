class CreateAuditors < ActiveRecord::Migration[6.1]
  def change
    create_table :auditors do |t|
      t.string :name

      t.timestamps
    end
  end
end

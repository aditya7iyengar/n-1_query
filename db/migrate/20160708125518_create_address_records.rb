class CreateAddressRecords < ActiveRecord::Migration
  def change
    create_table :address_records do |t|
      t.string :zip_code

      t.timestamps null: false
    end
  end
end

class AddClientRefToAddressRecords < ActiveRecord::Migration
  def change
    add_reference :address_records, :client, index: true, foreign_key: true
  end
end

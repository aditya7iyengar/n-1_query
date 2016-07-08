json.array!(@address_records) do |address_record|
  json.extract! address_record, :id
  json.url address_record_url(address_record, format: :json)
end

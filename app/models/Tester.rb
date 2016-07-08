class Tester
  def self.select_client_names_and_zip_codes(limit)
    clients = Client.limit(limit)

    clients.each do |client|
      name = client.name
      zip_code = client.address_record.zip_code
    end
  end

  def self.benchmark_client_names_and_zip_codes(limit=999)
    time_recorder = TimeRecorder.new
    time_recorder.benchmark do
      select_client_names_and_zip_codes(limit)
    end
  end

  def self.select_client_names_and_zip_codes_improved(limit)
    clients = Client.includes(:address_record).limit(limit)

    clients.each do |client|
      name = client.name
      zip_code = client.address_record.zip_code
    end
  end

  def self.benchmark_client_names_and_zip_codes_improved(limit=999)
    time_recorder = TimeRecorder.new
    time_recorder.benchmark do
      select_client_names_and_zip_codes_improved(limit)
    end
  end

  # Tester.select_client_names_and_zip_codes
  # Tester.select_client_names_and_zip_codes_improved
  # Tester.benchmark_client_names_and_zip_codes
  # Tester.benchmark_client_names_and_zip_codes_improved
  # Tester.populator(1000, 1000)
  # ActiveRecord::Base.logger = nil

  def self.populator(client_max=100, address_record_max=100)
    client_index = 0
    loop do
      Client.create(name: "Client#{client_index}")
      client_index += 1
      break if client_index >= client_max
    end

    address_record_index = 0
    loop do
      AddressRecord.create(zip_code: "#{(address_record_index * address_record_index).to_s}", client_id: address_record_index)
      address_record_index += 1
      break if address_record_index >= address_record_max
    end
  end
end

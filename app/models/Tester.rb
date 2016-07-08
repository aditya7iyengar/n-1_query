class Tester
  def self.print_client_names_and_zip_codes(limit=10)
    clients = Client.limit(limit)

    clients.each do |client|
      puts "#{client.name} | #{client.address_record.zip_code}"
    end
  end
end

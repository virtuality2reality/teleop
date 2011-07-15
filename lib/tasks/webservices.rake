namespace :ws do
  desc "Post calls to DevisProx"
  task :post, :client_name, :needs => :environment do |t, args|
    client_name = args[:client_name]
    client = Client.find_by_name(client_name)
    if client.nil?
      WS_LOGGER.error "Client introuvable: #{client_name}"
    else
      case client.name
      when "DevisProx"
        Webservices::DevisProx.new().post_calls(client)
      end
    end
  end
end

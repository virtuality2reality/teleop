namespace :ws do
  namespace :devisprox do
    desc "Post calls to DevisProx"
    task :post => :environment do
      Webservices::DevisProx.new().post_calls
    end
  end
end

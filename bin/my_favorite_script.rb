require 'addressable/uri'
require 'rest-client'

def create_favorite
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: 'users/1/contacts/1/favorites.json'
  ).to_s

  begin
    puts RestClient.post( url, {} )
  rescue RestClient::Exception
    puts "Fail happened"
  end
end

def destroy_favorite
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: 'users/1/contacts/1/favorites.markdown'
  ).to_s

  puts RestClient.delete(url)
end

create_favorite

require 'addressable/uri'
require 'rest-client'

def create_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts.json'
  ).to_s

  begin
    puts RestClient.post(
      url,
      { contact: { user_id: 1, name: "Babe Ruth", email: "whatsemail@1940s.com" } }
    )
  rescue RestClient::Exception
    puts "It happened!"
  end

end

def update_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/2'
  ).to_s

  puts RestClient.patch(
    url,
    {contact: { name: "Babe's Ruth Chris"} }
  )
end

def destroy_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/2'
  ).to_s

  puts RestClient.delete(
    url
  )
end

def show_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/1'
  ).to_s

  puts RestClient.get(url)
end

def show_user_contacts
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1/contacts'
  ).to_s

  puts RestClient.get(url)
end

show_user_contacts

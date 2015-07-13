require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin
    puts RestClient.post(
      url,
      { user: { name: "Scotty Pippin", email: "pyongyang@nk.com" } }
    )
  rescue RestClient::Exception
    puts "It happened!"
  end

end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2'
  ).to_s

  puts RestClient.patch(
    url,
    { user: { email: "pie@pie.com" } }
  )
end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1'
  ).to_s

  puts RestClient.delete(
    url
  )

end

def show_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1'
  ).to_s


    puts RestClient.get(url)

end

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users',
#   query_values: {
#     'some_category[a_key]' => 'another value',
#     'some_category[a_second_key]' => 'yet another value',
#     'some_category[inner_inner_hash][key]' => 'value',
#     'something_else' => 'aaahhhhh'
#   }
# ).to_s

# puts RestClient.get(url)


create_user

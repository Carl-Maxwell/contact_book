require 'addressable/uri'
require 'rest-client'

def create_comment
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: 'contacts/1/comments.json'
  ).to_s

  begin
    puts RestClient.post(
      url,
      { comment: { body: "boop bop bop" } }
    )
  rescue RestClient::Exception
    puts "It happened!"
  end

end

def destroy_comment
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/comments/2'
  ).to_s

  puts RestClient.delete(
    url
  )
end

def show_user_comments
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1/comments'
  ).to_s

  puts RestClient.get(url)
end

def show_contact_comments
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/1/comments'
  ).to_s

  puts RestClient.get(url)
end

show_user_comments

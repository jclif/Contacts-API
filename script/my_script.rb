require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: 'favorites/2',
  # query_values: {
  #   'favorite[user_id]' => 1,
  #   'favorite[contact_id]' => 4
  # }
).to_s

puts RestClient.create(url, {})
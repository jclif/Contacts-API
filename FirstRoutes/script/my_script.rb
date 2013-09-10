require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users',
  query_values: {
    'user[name]' => 'another value',
    'user[email]' => 'yet another value'
  }
).to_s

puts RestClient.post(url, {})
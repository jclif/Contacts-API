require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: 'groups',
  query_values: {
    'group[user_id]' => 1,
    'group[name]' => "BEST CONTACTS OH MAN"
  }
).to_s

# Issue: how do we add contacts to the groups?
puts RestClient.post(url, {})
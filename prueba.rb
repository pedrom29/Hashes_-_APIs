require 'uri'
require 'net/http'
require 'json'

url = URI("https://api.nasa.gov/planetary/apod?api_key=NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["cache-control"] = 'no-cache'
request["Postman-Token"] = 'd05c7333-c165-4fc9-9476-bcef2f39fa43'

response = http.request(request)
puts response.read_body
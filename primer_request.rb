require 'uri'
require 'net/http'
require 'json'

def request(address)
    url = URI(address)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["Postman-Token"] = '930aacdb-2b88-42fc-8cc8-6419022d2780'

    response = http.request(request)
    JSON.parse response.read_body
end
body = request('http://jsonplaceholder.typicode.com/posts') 
body.each do |post|
    puts post['title']
end
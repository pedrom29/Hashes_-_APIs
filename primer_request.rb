require 'uri'
require 'net/http'
require 'json'

def request(address)
    url = URI("http://jsonplaceholder.typicode.com/posts")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["Postman-Token"] = '2814cee2-f691-4a07-b9ed-ee99b262860e'

    response = http.request(request)
    body = JSON.parse response.read_body
end

body = request('http;//jsonplaceholder.typicode.com/posts')
body.each do |post|
    puts post['tittle']
end
require 'uri'
require 'net/http'
require 'json'
require 'openssl'

def request(address, api_key)
    url = URI(address+"&api_key="+api_key)
    http = Net::HTTP.new(url.host, url.port)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["Postman-Token"] = '251e4a0e-ad0f-405c-9792-08d049ab496b'

    response = http.request(request)
    JSON.parse response.read_body
end

def build_web_page(data)

    web = "<ul>"
    data.each do |photo|
        web += "<li><img src=\"#{photo['img_src']}\">\n</li>"
    end
    web += "</ul>"

    File.write('index.html', web)
end




data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000", "2y4Kfc1QTMpM5TYq4VkPn0Fd652aJpbp516DxTDD")
data = data["photos"][0..5]
build_web_page(data)

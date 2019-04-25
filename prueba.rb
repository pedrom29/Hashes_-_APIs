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
body = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000", "2y4Kfc1QTMpM5TYq4VkPn0Fd652aJpbp516DxTDD")
body = body["photos"][0..5]


def build_web_page(body)
    html = "<html>\n<title>API Nasa</title>\n<head>\n<h1>API Nasa<h1>\n</head>\n<body>\n<ul>\n"
    body.collect {|img|
        html += "\t<li><img src=\"#{img["img_src"]}\"></li>\n"}
    
    
    html += "</ul>\n</body>\n</html>"

    File.write('index.html', html)
end


def photo_count(body)
    hash = {}
    body.collect{|cam| hash[cam['camera']['name']] = 1 + hash[cam['camera']['name']].to_i}
    return hash
end
puts photo_count(body)
build_web_page(body)
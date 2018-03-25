require "json"
require "httparty"

class ResultsService
  attr_reader :api_response
  include HTTParty

  base_uri ""

  def get_response
    # Built by LucyBot. www.lucybot.com
    # https://developer.nytimes.com/top_stories_v2.json#/Console/GET/%7Bsection%7D.%7Bformat%7D
    uri = URI("https://api.nytimes.com/svc/topstories/v2/home.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    uri.query = URI.encode_www_form({
      "api-key" => "103a2f8fe48f4435bd2a2bc5244a8931"
    })
    request = Net::HTTP::Get.new(uri.request_uri)
    @api_response = JSON.parse(http.request(request).body)['results']
    # puts @api_response
  end

  def get_sections
    arr = []
    get_response.each do |result|
      arr << result['section']
    end
    arr
  end

end

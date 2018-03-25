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
      "api-key" => "9475a911b98b401b9b7f892722e93807"
      # "api-key" => "103a2f8fe48f4435bd2a2bc5244a8931"
    })
    request = Net::HTTP::Get.new(uri.request_uri)
    @api_response = JSON.parse(http.request(request).body)['results']
    # puts @api_response
  end

  def get_titles
    arr = []
    get_response.each do |result|
      arr << result['section']
    end
    arr
  end

  def get_max_index
    get_titles.length-1
  end

  def is_valid_index index
    (0..get_max_index).cover?(index)
  end

  def get_title index
    if is_valid_index index
      get_response[index]['title']
    end
  end

  def get_section index
    if is_valid_index index
      get_response[index]['section']
    end
  end

  def get_abstract index
    if is_valid_index index
      get_response[index]['abstract']
    end
  end

  def get_URL index
    if is_valid_index index
      get_response[index]['short_url']
    end
  end

  def get_byline index
    if is_valid_index index
      get_response[index]['byline']
    end
  end

  def get_article index
    if is_valid_index index
      article = []
      article << get_title(index)
      article << get_section(index)
      article << get_abstract(index)
      article << get_URL(index)
      article << get_byline(index)
      article
    end
  end

  def get_single_article_for_index index
    if is_valid_index index
      article = []
      article << get_title(index)
      article << get_URL(index)
      article
    end
  end

  def get_articles_for_index
    all_articles = []
    get_titles.each do |i|
      all_articles << get_single_article_for_index(i)
    end
    all_articles
  end

end

require 'net/http'
require 'json'

module GetLinks

  MAX_TWEET = '100'

  def connect(search_text)
    #http://search.twitter.com/search.json?q=blue%20angels&rpp=5&include_entities=true&result_type=mixed
    uri = URI('http://search.twitter.com/search.json?')
    params = { :q => search_text, :rpp => MAX_TWEET, :include_entities => 'true', :result_type => 'recent' }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    json = res.body
    parsed_json = JSON.parse(json)

    if parsed_json['error']
      raise "Twitter responded with an error body: #{parsed_json['error']}"
    end

    results = parsed_json["results"]
    #results.collect{|x| x["entities"]["urls"][0]["expanded_url"]
    return results
  end

end

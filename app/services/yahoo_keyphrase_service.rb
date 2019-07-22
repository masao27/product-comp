require 'uri'
require 'rexml/document'
class YahooKeyphraseService
  attr_reader :endpoint_uri, :query

  def initialize(sentence)
    query_tmp = URI.escape(sentence)
    @endpoint_uri = "https://shopping.yahooapis.jp/ShoppingWebService/V1/itemSearch?appid=#{ENV['YAHOO_APP_ID']}&query=#{query_tmp}"
  end

  def execute
    tmp_hash=[]
    result_array=[]
 
    http_client = HTTPClient.new
    response    = http_client.post(endpoint_uri)
    
    # XMLで返ってくるので、from_xmlメソッドでハッシュに変換。
    get_hash    = Hash.from_xml(response.body)['ResultSet']['Result']

    tmp_hash    = get_hash['Hit']

    if tmp_hash.size > 1 then
      tmp_hash    = [tmp_hash] if tmp_hash.instance_of?(Hash)
      tmp_hash.each do |ghash|
        result_hash = {Name: "#{ghash["Name"]}", Description: "#{ghash["Description"]}", StoreName: "#{ghash["Store"]["Name"]}",StoreUrl: "#{ghash["Url"]}", Image: "#{ghash["Image"]["Medium"]}",Price: "#{ghash["Price"]}"}
        result_array << result_hash
      end    
    end
    return result_array
  end
end

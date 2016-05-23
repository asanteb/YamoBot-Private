require 'rubygems'
require 'json'
require 'net/http'
require 'net/https'
require 'uri'
load 'blueprints.rb'
load 'config-oauth.rb'
load 'tls.rb'


class Like

  def likeTweet(tweet_id)
    instructions = Blueprints.new
    api_url = instructions.getAPI_URL
    command_url = instructions.getLike_URL

    address = URI("#{api_url}#{command_url}")
    request = Net::HTTP::Post.new address.request_uri
    request.set_form_data id: tweet_id # replaces hash rocket =>

    authReq = TLS.new
    authReq.connect_req(address, request)

    #@tweet = JSON.parse(response.body)
  end
end

class Unlike

  def unlikeTweet(tweet_id)
    instructions = Blueprints.new
    api_url = instructions.getAPI_URL
    command_url = instructions.getUnlike_URL

    address = URI("#{api_url}#{command_url}")
    request = Net::HTTP::Post.new address.request_uri
    request.set_form_data("id" => tweet_id)

    authReq = TLS.new
    authReq.connect_req(address, request)
  end

end


class LikeList

 def getList(num_of_tweets, user_id, screen_name)
  instructions = Blueprints.new
  api_url = instructions.getAPI_URL
  command_url = instructions.getLikeList_URL


  address = URI("#{api_url}#{command_url}")



  if user_id
    address = URI("#{address}?count=#{num_of_tweets}&screen_name=#{user_id}")
  end

  if screen_name
    address = URI("#{address}?count=#{num_of_tweets}&screen_name=#{screen_name}")
  end

  request = Net::HTTP::Get.new address.request_uri
  authReq = TLS.new
  response = authReq.connect_req(address, request)

  temp_tweets = JSON.parse(response.body)
  @tweets = JSON.pretty_generate(temp_tweets) #returns json format
 end

end


  #MyList = LikeList.new
  #json_body = MyList.getList(5, nil, "OfficialElethal")
  #File.open("tweets.json", 'w') {|f| f.write(json_body) }

new_like = Like.new
new_like.likeTweet("734744294939070464")

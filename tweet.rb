require 'rubygems'
require 'json'
require 'net/http'
require 'net/https'
require 'uri'
load 'blueprints.rb'
load "tls.rb"


class PostTweet

  def post_tweet str_body

    instructions = Blueprints.new
    api_url = instructions.getAPI_URL
    command_url = instructions.getTweetPost_URL

    address = URI("#{api_url}#{command_url}")
    request = Net::HTTP::Post.new address.request_uri
    request.set_form_data status: str_body

    authReq = TLS.new
    authReq.connect_req address, request  # () Can be removed


   #@tweet = JSON.parse(response.body)

  end

  FirstPost = PostTweet.new
  FirstPost.post_tweet "poop"

end
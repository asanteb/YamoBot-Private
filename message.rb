require 'rubygems'
require 'json'
require 'net/http'
require 'net/https'
require 'uri'
load 'blueprints.rb'
load 'config-oauth.rb'
load 'tls.rb'


class Message

  def direct_message(user_id, screen_name, text)

    instructions = Blueprints.new
    api_url = instructions.getAPI_URL
    command_url = instructions.getMessage_URL

    address = URI("#{api_url}#{command_url}")
    address = URI("#{address}?text=#{text}&screen_name=#{screen_name}") if screen_name
    address = URI("#{address}?text=#{text}&user_id=#{user_id}") if user_id

    request = Net::HTTP::Post.new address.request_uri
    authReq = TLS.new
    authReq.connect_req address, request

  end
end

new_message = Message.new
new_message.direct_message(nil,"larry_lawal","I dont know how nicki became such a big bitch")

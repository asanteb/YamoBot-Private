require 'rubygems'
require 'json'
require 'net/http'
require 'net/https'
require 'uri'
load 'blueprints.rb'
load 'config-oauth.rb'
load 'tls.rb'

class Follow

  def follow(user_id, screen_name, bool)
    instructions = Blueprints.new
    api_url = instructions.getAPI_URL
    command_url = instructions.getFollow_URL

    address = URI("#{api_url}#{command_url}")
    address = URI("#{address}?screen_name=#{screen_name}&follow=#{bool}") if screen_name
    address = URI("#{address}?user_id=#{user_id}&follow=#{bool}") if user_id

    request = Net::HTTP::Post.new address.request_uri
    authReq = TLS.new
    authReq.connect_req address, request
  end

end

class Unfollow

  def unfollow(user_id, screen_name)
    instructions = Blueprints.new
    api_url = instructions.getAPI_URL
    command_url = instructions.getUnfollow_URL

    address = URI("#{api_url}#{command_url}")
    address = URI("#{address}?screen_name=#{screen_name}") if screen_name
    address = URI("#{address}?user_id=#{user_id}") if user_id

    request = Net::HTTP::Post.new address.request_uri
    authReq = TLS.new
    authReq.connect_req address, request
  end

end

please_follow = Unfollow.new

please_follow.unfollow(nil,"YouTubeGaming")
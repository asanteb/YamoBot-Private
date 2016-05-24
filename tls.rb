require 'rubygems'
require 'oauth'
require 'json'
require 'net/http'
require 'net/https'
require 'uri'
load "config-oauth.rb"


class TLS

  def connect_req(address, request)
    http = Net::HTTP.new address.host, address.port
    http.use_ssl = true
    http.ssl_version = :SSLv3
    http.ssl_version = :TLSv1
    http.ca_file = File.join(File.dirname('cacert.pem'), "cacert.pem" )
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER


    #puts "Enter Consumer Key"
    #con_key = gets
    #puts "Enter Consumer Secret"
    #con_sec = gets
    #puts "Enter Access Token"
    #acc_tok = gets
    #puts "Enter Access Secret"
    #acc_sec = gets


    authenticator = USER_OAUTH.new
    consumer_key = authenticator.getConsumerKey
    access_token = authenticator.getAccessToken

    request.oauth! http, consumer_key, access_token
    http.start

   @response = http.request request #sends body response to classes that might use it

    #File.open("response.txt", 'w') {|f| f.write(@response) }

  end
end
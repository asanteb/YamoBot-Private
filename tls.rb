require 'rubygems'
require 'oauth'
require 'json'
require 'net/http'
require 'net/https'
require 'uri'


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

    auth = Array.new(4)

    File.open("auth.temp", "r")
    auth.each do |line, index|
      auth = line
      puts "#{line}"
    end

    authenticator = USER_OAUTH.new
    consumer_key = authenticator.getConsumerKey(auth.at(0), auth.at(1))
    access_token = authenticator.getAccessToken(auth.at(2), auth.at(3))
=begin
    consumer_key = authenticator.getConsumerKey("ZFLvIdkjS3sxwVtT15wjb4TOW",
                                                "WWN5DfCx7RfAUNuCQgxvmc3USvMAWPjxLqdLSr9u11kNP92Z2B")
    access_token = authenticator.getAccessToken("117545816-JgPzKxG4kUbFJK30ZLAA98VRICKZtIMEu8J8wlMD",
=end                                              #  "uMWFd8nfFJZR0a7UxNUR9AFB9Yn0VdoN72PJENy7AKGVz")


    request.oauth! http, consumer_key, access_token
    http.start

   @response = http.request request #sends body response to classes that might use it

    File.open("response.txt", 'w') {|f| f.write(@response) }

  end
end
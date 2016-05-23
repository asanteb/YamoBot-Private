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

    authenticator = USER_OAUTH.new
    consumer_key = authenticator.getConsumerKey("ZFLvIdkjS3sxwVtT15wjb4TOW",
                                                "WWN5DfCx7RfAUNuCQgxvmc3USvMAWPjxLqdLSr9u11kNP92Z2B")
    access_token = authenticator.getAccessToken("117545816-JgPzKxG4kUbFJK30ZLAA98VRICKZtIMEu8J8wlMD",
                                                "uMWFd8nfFJZR0a7UxNUR9AFB9Yn0VdoN72PJENy7AKGVz")

    request.oauth! http, consumer_key, access_token
    http.start

   @response = http.request request #sends body response to classes that might use it

  end
end
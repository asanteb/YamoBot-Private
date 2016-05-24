require 'rubygems'
require 'oauth'
load "config-settings.rb"

class USER_OAUTH

  def getConsumerKey

    boolObj = Config.new
    bool = boolObj.local_keys

    filename = "auth.temp" if bool
    filename = "local.keys" if bool

    auth = Array.new
    f = File.readlines(filename)
    f.each do |line|
     auth << line.strip
    end

    @consumer_key = OAuth::Consumer.new(auth[0], auth[1])
  end

  def getAccessToken

    boolObj = Config.new
    bool = boolObj.local_keys

    filename = "auth.temp" if bool
    filename = "local.keys" if bool

    auth = Array.new
    f = File.readlines(filename)
    f.each do |line|
      auth << line.strip
    end

    @access_token = OAuth::Token.new(auth[2], auth[3])
  end

end

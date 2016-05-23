require 'rubygems'
require 'oauth'

class USER_OAUTH
  def getConsumerKey(con_key, con_secret)
    @consumer_key = OAuth::Consumer.new(con_key, con_secret)
  end

  def getAccessToken(acc_tok, acc_sec)
    @access_token = OAuth::Token.new(acc_tok, acc_sec)
  end

end

class Blueprints

  def getAPI_URL
    @url = "https://api.twitter.com"
  end

  def getTweetPost_URL
    @url = "/1.1/statuses/update.json"
  end

  def getLike_URL
    @url = "/1.1/favorites/create.json"
  end

  def getUnlike_URL
    @url = "/1.1/favorites/destroy.json"
  end

  def getLikeList_URL
    @url = "/1.1/favorites/list.json"
  end

  def getFollow_URL
    @url = "/1.1/friendships/create.json"
  end

  def getUnfollow_URL
    @url = "/1.1/friendships/destroy.json"
  end

  def getFollowerComparison_URL
    #@url = "/1.1/friendships/destroy.json"
  end

  def getMessage_URL
    @url = "/1.1/direct_messages/new.json"
  end

end
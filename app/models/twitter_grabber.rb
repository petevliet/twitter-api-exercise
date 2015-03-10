class TwitterGrabber

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.consumer_key
      config.consumer_secret     = Rails.application.secrets.consumer_secret
      config.access_token        = Rails.application.secrets.access_token
      config.access_token_secret = Rails.application.secrets.access_token_secret
    end
  end

  def my_tweets
    @client.user_timeline("Pete_Vliet")
  end

  def my_followers
    @client.friends.map {|f| @client.user_timeline(f)}
  end

  def look_up_tweets(username)
    @client.user_timeline(username)
  end

  def post_tweet(message)
    @client.update(message)
  end

end

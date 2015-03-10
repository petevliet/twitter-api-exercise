class WelcomeController < ApplicationController

  def index
    @tweetget = TwitterGrabber.new
    @mytweets = @tweetget.my_tweets
    @findtweets = @tweetget.look_up_tweets(params[:username])
    @my_buddies = @tweetget.my_followers

    if params.has_key?(:message)
      @post_tweet = @tweetget.post_tweet(params[:message])
    end
  end

end

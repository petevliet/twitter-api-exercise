class WelcomeController < ApplicationController

  def index
    @tweetget = TwitterGrabber.new
    @mytweets = @tweetget.my_tweets
  end

end

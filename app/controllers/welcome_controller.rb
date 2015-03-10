class WelcomeController < ApplicationController

  def index
    @tweetget = TwitterGrabber.new
    @mytweets = @tweetget.my_tweets
    @findtweets = @tweetget.look_up_tweets(params[:username])
    @my_buddies = @tweetget.my_followers

    if params[:follow_username].present?
      @follow = @tweetget.follow_user(params[:follow_username])
    end

    if params.has_key?(:username_followers)
      @user_followers = @tweetget.see_followers(params[:username_followers])
    end

    if params.has_key?(:message)
      @post_tweet = @tweetget.post_tweet(params[:message])
    end

  end

end

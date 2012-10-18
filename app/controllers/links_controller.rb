class LinksController < ApplicationController


  def create
    @tweet_urls = params[:tweet_url]
    @tweet_urls.each do |tweet|
      @tweet_url = CGI::unescape(tweet)
      #@tweet_id = params[:tweet_id]
      @link = Link.new(:url => @tweet_url)
      @link.user_id = current_user.id
      @link.save
    end
  end
end

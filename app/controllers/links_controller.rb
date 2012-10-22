class LinksController < ApplicationController

  respond_to :js

  def create
    @tweet_urls = params[:tweet_url]
    @tweet_urls.each do |tweet|
      @tweet_url = CGI::unescape(tweet)
      @link = current_user.links.build(:url => @tweet_url)
      @link.save
    end
  end
end

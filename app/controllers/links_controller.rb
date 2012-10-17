class LinksController < ApplicationController


  def create
    @tweet_url = CGI::unescape(params[:tweet_url])
    @tweet_id = params[:tweet_id]
    @link = Link.new(:url => @tweet_url)
    @link.user_id = current_user.id
    if @link.save
      respond_to do |format|
        format.js
      end
    else
      flash.now[:error] = @link.errors.full_messages
    end
  end
end

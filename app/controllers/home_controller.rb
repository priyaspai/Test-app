class HomeController < ApplicationController

  require 'twitter_search'
  MAX_TWEET = '100'

  def index
  end

  def search
    client = TwitterSearch::Client.new('Tweetzz')
    @search_results = client.query(:q => params[:search], :lang => 'en', :rpp => MAX_TWEET)
    respond_to do |format|
      format.js
    end
  end

end

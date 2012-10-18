class HomeController < ApplicationController

  include GetLinks

  def index
  end

  def search
    @search_results = connect(params[:search])
    respond_to do |format|
      format.js
    end
  end

end

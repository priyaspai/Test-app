class HomeController < ApplicationController

  include GetLinks

  def index
    respond_to do |format|
      format.html
    end
  end

  def search
    begin
      @search_results = connect(params[:search])
      respond_to do |format|
        format.js
      end
    rescue Exception => e
      respond_to do |format|
        flash[:notice] = "Error in Search"
        @error = e.to_s
        format.js { render 'search_error.js.erb' }
      end
    end
  end

end

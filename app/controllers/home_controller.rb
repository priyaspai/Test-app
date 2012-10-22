class HomeController < ApplicationController

  include GetLinks
  respond_to :html, :js

  def index
  end

  def search
    begin
      @search_results = connect(params[:search])
      respond_with(@search_results)
    rescue Exception => e
      flash[:notice] = "Error in Search"
      @error = e.to_s
      respond_with(@error) do |format|
        format.js { render 'search_error.js.erb' }
      end
    end
  end

end

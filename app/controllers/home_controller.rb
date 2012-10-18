class HomeController < ApplicationController

  include GetLinks

  def index
  end

  def search
    begin
      @search_results = connect(params[:search])
      respond_to do |format|
        format.js
      end
    rescue Exception => e
      redirect_to(root_path, :flash => { :notice => "Error in Search" }) and return
    end
  end

end

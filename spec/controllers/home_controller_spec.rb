require 'spec_helper'

describe HomeController do

  login_user

  describe "User Logged on" do
    it "should have a current_user" do
      subject.current_user.should_not be_nil
    end
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'search'" do
    it "should search successfully" do
      get 'search',{:search => "php", :format => "js"}
      response.should render_template('home/search')
    end
    it "should raise error" do
      get 'search', {:search => "", :format => "js"}
      flash[:notice].should be_eql("Error in Search" )
      response.should redirect_to(:root)
    end
  end


end

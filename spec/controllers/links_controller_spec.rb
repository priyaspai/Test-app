require 'spec_helper'

describe LinksController do

  login_user

  describe "User Logged on" do
    it "should have a current_user" do
      subject.current_user.should_not be_nil
    end
  end

  describe "POST 'create'" do
    it "links should be successfully posted" do
      post :create, :tweet_url=> ["http://www.google.com"], :format => "js"
      response.should be_success
    end
  end

end

require 'spec_helper'

describe Link do
  it "has a valid factory" do
    FactoryGirl.create(:link).should be_valid
  end
  it "should be required" do
    blank = FactoryGirl.build(:link, :url => "")
    blank.should_not be_valid
    blank.errors[:url].should include("can't be blank")

    blank.url = "http://www.bing.com"
    blank.should be_valid
  end
  it "does not allow duplicate links per user" do
    user = FactoryGirl.build(:user)
    FactoryGirl.build(:link, user: user, url: "http://www.facebook.com").save
    duplicate = FactoryGirl.build(:link, user: user, url: "http://www.facebook.com")
    duplicate.save
    duplicate.should_not be_valid
    duplicate.errors[:url].should include("Link is already saved")
  end
end

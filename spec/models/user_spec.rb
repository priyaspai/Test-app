require 'spec_helper'

describe User do
  it "should authenticate with matching username and password" do
    FactoryGirl.build(:user, :email => "test@tcs.com", :password => 'secret').should be_valid
  end

  it "should not authenticate with incorrect password" do
    FactoryGirl.build(:user, :email => "test@tcs.com", :password => 'order').should_not be_valid
  end

  it "should not allow empty user" do
    FactoryGirl.build(:user, :email => "", :password => "secret").should_not be_valid
  end
end

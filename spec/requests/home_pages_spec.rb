require 'spec_helper'

describe "HomePages" do
  it "successful login" do
    user = FactoryGirl.create(:user, :email => "test@tcs.com", :password => "secret")
    visit "/users/sign_in"
    fill_in "Email", :with => "test@tcs.com"
    fill_in "Password", :with => "secret"
    click_button "Sign in"

    page.should have_content("Signed in successfully")
  end
end


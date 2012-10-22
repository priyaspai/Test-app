require 'spec_helper'

describe UsersController do

  login_user


  describe "GET 'links'" do
    it "get links saved by a user" do
      get :links, :id => subject.current_user.id
      response.should be_success
    end
  end

end

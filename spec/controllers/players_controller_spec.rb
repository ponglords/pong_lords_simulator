require 'spec_helper'

describe PlayersController do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'

      response.should be_success
      assigns(:players).should_not be_nil
    end
  end
end

require 'spec_helper'

describe PlayersController do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'

      response.should be_success
      assigns(:elo_players).should_not be_nil
      assigns(:diversity_index_players).should_not be_nil
    end
  end
end

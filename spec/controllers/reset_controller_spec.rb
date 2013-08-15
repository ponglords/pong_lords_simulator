require 'spec_helper'

describe ResetController do

  describe "DELETE 'destroy'" do
    it "redirects to the player page" do
      Result.should_receive(:delete_all)
      Match.should_receive(:delete_all)
      Player.should_receive(:update_all).with(ranking: Player::DEFAULT_RANKING, reached_pro: false)

      delete 'destroy'

      response.should redirect_to(players_path)
    end
  end

end

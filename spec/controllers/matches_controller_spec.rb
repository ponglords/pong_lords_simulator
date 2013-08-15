require 'spec_helper'

describe MatchesController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'

      response.should be_success
      assigns(:match).should_not be_nil
      assigns(:players).should_not be_nil
    end
  end

  describe "POST 'create'" do
    context "the players are different" do
      let(:loser) { double }
      let(:winner) { double }
      let(:results) { double }
      let(:match) { double(results: results) }
      let(:parameters) do
        { match: { loser: { player_id: 1 }, winner: { player_id: 2 } } }
      end

      context "the create was successful" do
        it "redirects to the players page" do
          Match.stub(:new) { match }
          Player.should_receive(:find).with("1") { loser }
          Player.should_receive(:find).with("2") { winner }
          results.should_receive(:build).with(player: loser, won: false)
          results.should_receive(:build).with(player: winner, won: true)
          match.should_receive(:save) { true }

          post 'create', parameters

          response.should redirect_to(players_path)
        end
      end

      context "there are errors when saving" do
        it "redirects to the players page" do
          Match.stub(:new) { match }
          Player.should_receive(:find).with("1") { loser }
          Player.should_receive(:find).with("2") { winner }
          results.should_receive(:build).with(player: loser, won: false)
          results.should_receive(:build).with(player: winner, won: true)
          match.should_receive(:save) { false }

          post 'create', parameters

          response.should render_template(:new)
        end
      end
    end

    context "the players are the same" do
      let(:parameters) do
        { match: { loser: { player_id: 1 }, winner: { player_id: 1 } } }
      end

      it "redirects to the new match page" do
        post 'create', parameters

        response.should redirect_to(new_match_path)
      end
    end
  end
end

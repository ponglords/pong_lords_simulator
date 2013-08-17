require 'spec_helper'

describe DoublesController do

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
      let(:loser_1) { double }
      let(:loser_2) { double }
      let(:winner_1) { double }
      let(:winner_2) { double }
      let(:results) { double }
      let(:match) { double(results: results) }
      let(:parameters) do
        { match: { first_loser: { player_id: 1 },
                   second_loser: { player_id: 2 },
                   first_winner: { player_id: 3 },
                   second_winner: { player_id: 4 },
                 }
        }
      end

      context "the create was successful" do
        it "redirects to the players page" do
          Match.stub(:new) { match }
          Player.should_receive(:find).with("1") { loser_1 }
          Player.should_receive(:find).with("2") { loser_2 }
          Player.should_receive(:find).with("3") { winner_1 }
          Player.should_receive(:find).with("4") { winner_2 }
          results.should_receive(:build).with(player: loser_1, won: false)
          results.should_receive(:build).with(player: loser_2, won: false)
          results.should_receive(:build).with(player: winner_1, won: true)
          results.should_receive(:build).with(player: winner_2, won: true)
          match.should_receive(:save) { true }

          post 'create', parameters

          response.should redirect_to(players_path)
        end
      end

      context "there are errors when saving" do
        it "redirects to the players page" do
          Match.stub(:new) { match }
          Player.should_receive(:find).with("1") { loser_1 }
          Player.should_receive(:find).with("2") { loser_2 }
          Player.should_receive(:find).with("3") { winner_1 }
          Player.should_receive(:find).with("4") { winner_2 }
          results.should_receive(:build).with(player: loser_1, won: false)
          results.should_receive(:build).with(player: loser_2, won: false)
          results.should_receive(:build).with(player: winner_1, won: true)
          results.should_receive(:build).with(player: winner_2, won: true)
          match.should_receive(:save) { false }

          post 'create', parameters

          response.should render_template(:new)
        end
      end
    end

    context "the players are the same" do
      let(:parameters) do
        { match: { first_loser: { player_id: 1 },
                   second_loser: { player_id: 2 },
                   first_winner: { player_id: 3 },
                   second_winner: { player_id: 2 },
                 }
        }
      end

      it "redirects to the new match page" do
        post 'create', parameters

        response.should redirect_to(new_double_path)
      end
    end
  end
end

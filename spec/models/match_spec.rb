require 'spec_helper'

describe Match do
  describe "before_save" do
    it "should update all of the player's ranking" do
      @match = FactoryGirl.create(:match)

      RankingCalculator.should_receive(:new).twice { double(update_ranking: nil) }
      DiversityIndexCalculator.should_receive(:new).twice { double(update_points: nil) }
      EloWithDiversityIndexCalculator.should_receive(:new).twice { double(update_score: nil) }

      @match.save!
    end
  end
end

class Match < ActiveRecord::Base
  after_save :update_player_rankings

  has_many :results
  has_many :players, through: :results

  private

  def update_player_rankings
    results.each do |result|
      RankingCalculator.new(result, results.where(won: !result.won?).map(&:player), result.won?).update_ranking
      DiversityIndexCalculator.new(result.player).update_points
    end
  end
end

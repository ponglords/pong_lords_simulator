class Match < ActiveRecord::Base
  before_save :update_player_rankings

  has_many :results
  has_many :players, through: :results

  private

  def update_player_rankings
    results.each do |result|
      filtered_results = results.reject { |r| r.player_id == result.player.id }
      RankingCalculator.new(result, filtered_results.first.player, result.won?).update_ranking
    end
  end
end

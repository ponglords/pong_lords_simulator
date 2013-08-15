class RankingCalculator

  def initialize(result, opponent, won)
    @player = result.player
    @opponent = opponent
    @match_outcome = won ? 1 : 0
  end

  def update_ranking
    @player.ranking = (@player.ranking + change).to_i
    @player.reached_pro = true if @player.ranking >= Player::PRO_RANKING
    @player.save!
  end

  private

  def k_factor
    return 10 if @player.reached_pro?
    return 25 if @player.matches.count < Player::STARTER_BOUNDRY
    return 15
  end

  def probable_outcome
    1.0 / ( 1.0 + ( 10.0 ** ((@opponent.ranking - @player.ranking) / 400.0 )))
  end

  def change
    k_factor * (@match_outcome - probable_outcome)
  end
end

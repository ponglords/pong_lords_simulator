class PlayersController < ApplicationController
  def index
    @elo_players = Player.with_games.by_ranking
    @diversity_index_players = Player.with_games.by_diversity_index_points
    @elo_with_diversity_index_players = Player.with_games.by_elo_with_diversity_index
  end
end

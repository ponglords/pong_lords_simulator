class PlayersController < ApplicationController
  def index
    @elo_players = Player.with_games.by_ranking
    @diversity_index_players = Player.with_games.by_diversity_index_points
  end
end

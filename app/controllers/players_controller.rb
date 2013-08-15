class PlayersController < ApplicationController
  def index
    @players = Player.with_games.by_ranking
  end
end

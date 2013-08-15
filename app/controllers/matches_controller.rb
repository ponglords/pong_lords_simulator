class MatchesController < ApplicationController
  before_filter :ensure_distinct_players, only: [:create]

  def new
    @match = Match.new
    @players = Player.by_name.map { |p| [p.name, p.id] }
  end

  def create
    @match = Match.new

    losing_player = Player.find(params[:match][:loser][:player_id])
    winning_player = Player.find(params[:match][:winner][:player_id])

    @match.results.build(player: losing_player, won: false)
    @match.results.build(player: winning_player, won: true)

    if @match.save
      redirect_to players_path
    else
      render :new
    end
  end

  private

  def ensure_distinct_players
    return unless params[:match][:loser][:player_id] == params[:match][:winner][:player_id]
    redirect_to new_match_path, flash: { error: "Winner and loser must be different players" }
  end
end

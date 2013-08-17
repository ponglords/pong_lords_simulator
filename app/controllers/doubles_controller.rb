class DoublesController < ApplicationController
  before_filter :ensure_distinct_players, only: [:create]

  def new
    @match = Match.new
    @players = Player.by_name.map { |p| [p.name, p.id] }
  end

  def create
    @match = Match.new

    losing_player_1 = Player.find(params[:match][:first_loser][:player_id])
    losing_player_2 = Player.find(params[:match][:second_loser][:player_id])
    winning_player_1 = Player.find(params[:match][:first_winner][:player_id])
    winning_player_2 = Player.find(params[:match][:second_winner][:player_id])

    @match.results.build(player: losing_player_1, won: false)
    @match.results.build(player: losing_player_2, won: false)
    @match.results.build(player: winning_player_1, won: true)
    @match.results.build(player: winning_player_2, won: true)

    if @match.save
      redirect_to players_path
    else
      render :new
    end
  end

  private

  def ensure_distinct_players
    player_ids = [ params[:match][:first_loser][:player_id],
                   params[:match][:second_loser][:player_id],
                   params[:match][:first_winner][:player_id],
                   params[:match][:second_winner][:player_id]
                 ]

    return if player_ids.count == player_ids.uniq.count
    redirect_to new_double_path, flash: { error: "All players must be different" }
  end
end

class ResetController < ApplicationController
  def destroy
    Result.delete_all
    Match.delete_all
    Player.update_all(ranking: Player::DEFAULT_RANKING, reached_pro: false)

    redirect_to players_path
  end
end

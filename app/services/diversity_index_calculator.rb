# Uses a diversity index to calculate points
# http://en.wikipedia.org/wiki/Diversity_index
class DiversityIndexCalculator

  def initialize(player)
    @player = player
  end

  def update_points
    @player.diversity_index_points = calculate_new_score
    @player.save!
  end

  private

  def calculate_new_score
   match_ids = @player.results.pluck(:match_id)
   grouped_opponents = Result.where(match_id: match_ids)
                             .where.not(player: @player)
                             .where("doubles_partner_id IS NULL OR doubles_partner_id != #{@player.id}")
                             .group_by { |x| x.player_id }

   total_matches, total_offset = 0, 0

   grouped_opponents.each do |player_id, results|
     total_matches += results.count
     total_offset += results.count * (results.count - 1)
   end

   return 0.0 unless (total_matches * (total_matches - 1)) > 0

   net_wins = @player.wins - @player.losses
   diversity_index = 1 - (total_offset / (total_matches * (total_matches - 1)))

   ((net_wins * diversity_index) * 100).round(2)
  end

end

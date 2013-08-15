class Player < ActiveRecord::Base
  PRO_RANKING = 2400
  STARTER_BOUNDRY = 30
  DEFAULT_RANKING = 1000

  validates :name, presence: true, uniqueness: true

  has_many :results
  has_many :matches, through: :results

  scope :by_name, -> { order(:name) }
  scope :by_ranking, -> { order("ranking DESC") }
  scope :with_games, -> { joins(:results).where("players.id = results.player_id").distinct }
end

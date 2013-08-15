class Result < ActiveRecord::Base
  belongs_to :match
  belongs_to :player

  validates_uniqueness_of :player_id, scope: :match_id
end

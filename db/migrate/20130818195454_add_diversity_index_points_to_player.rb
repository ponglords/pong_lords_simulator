class AddDiversityIndexPointsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :diversity_index_points, :float, default: 0.0
  end
end

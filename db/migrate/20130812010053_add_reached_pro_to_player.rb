class AddReachedProToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :reached_pro, :boolean, default: false
  end
end

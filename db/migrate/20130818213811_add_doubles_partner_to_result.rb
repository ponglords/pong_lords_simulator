class AddDoublesPartnerToResult < ActiveRecord::Migration
  def up
    add_column :results, :doubles_partner_id, :integer
  end

  def down
    remove_column :results, :doubles_partner_id
  end
end

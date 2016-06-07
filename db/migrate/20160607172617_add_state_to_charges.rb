class AddStateToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :state, :integer
  end
end

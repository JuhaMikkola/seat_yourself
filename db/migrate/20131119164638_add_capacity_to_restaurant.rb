class AddCapacityToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :capacity, :integer
  end
end

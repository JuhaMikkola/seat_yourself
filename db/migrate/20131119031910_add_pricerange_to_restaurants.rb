class AddPricerangeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :pricerange, :string
  end
end

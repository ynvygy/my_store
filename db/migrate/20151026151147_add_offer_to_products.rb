class AddOfferToProducts < ActiveRecord::Migration
  def change
    add_column :products, :offer, :integer
  end
end

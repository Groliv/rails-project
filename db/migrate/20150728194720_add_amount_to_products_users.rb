class AddAmountToProductsUsers < ActiveRecord::Migration
  def change
    add_column :products_users, :amount, :decimal
  end
end

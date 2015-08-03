class RenameProductsUsersToBiddings < ActiveRecord::Migration
  def change
  	rename_table :products_users, :biddings
  end
end

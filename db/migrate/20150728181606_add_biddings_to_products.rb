class AddBiddingsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :startingprice, :decimal
    add_column :products, :immediatprice, :decimal
    add_column :products, :purchased, :boolean
    add_column :products, :bidenddate, :datetime
    add_column :products, :minbid, :decimal
  end
end

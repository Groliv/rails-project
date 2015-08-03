class CreateBiddings < ActiveRecord::Migration
  def change
    change_table :biddings do |t|

      t.timestamps null: false
    end
  end
end

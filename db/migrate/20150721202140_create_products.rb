class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.belongs_to :user,          index:true
     	t.string :title
    	t.text :description
		  t.decimal :price
		  t.string :image_url

      t.timestamps null: false
    end
  end
end

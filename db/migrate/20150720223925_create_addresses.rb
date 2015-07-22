class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :user,          index:true
      t.column :typeAddresse, :integer, default: 0
    	t.string :number,            null: false
    	t.string :street,            null: false
    	t.string :zipcode,           null: false
    	t.string :city,              null: false
    	t.string :country,           null: false
      t.timestamps null: false
    end
  end
end
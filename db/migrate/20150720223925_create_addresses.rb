class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :user,          index:true
      t.column :typeAddresse, :integer, default: 0
    	t.string :number,            null: false, default: ""
    	t.string :street,            null: false, default: ""
    	t.string :zipcode
    	t.string :city,              null: false, default: ""
    	t.string :country
      t.timestamps null: false
    end

  end
end
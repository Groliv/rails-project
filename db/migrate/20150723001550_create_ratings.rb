class CreateRatings < ActiveRecord::Migration
  def change
	create_table :ratings do |t|
		t.belongs_to 	:user,		index:true
		t.string  		:title
		t.text			:comment
		t.integer		:rate, default:0
		t.integer		:ratable_id
		t.string 		:ratable_type

		t.timestamps null: false
    end
  end
end

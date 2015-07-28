class AddAncestryToCategories < ActiveRecord::Migration

	def up
		change_table :categories do |c|
			c.add_column :categories, :ancestry, :string
		end
	end
 
	def down
		change_table :categories do |c|
			c.remove_column :categories, :ancestry, :string
		end
	end

end

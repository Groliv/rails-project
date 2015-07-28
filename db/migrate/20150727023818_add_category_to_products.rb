class AddCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :category_id, :integer, index: :true
  end
end

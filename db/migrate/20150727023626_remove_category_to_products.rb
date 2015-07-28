class RemoveCategoryToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :category_name, :string
  end
end

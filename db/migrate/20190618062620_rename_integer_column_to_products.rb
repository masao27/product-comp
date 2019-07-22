class RenameIntegerColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :integer, :price
  end
end

class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text      :prodname
      t.text      :description
      t.text      :storename
      t.text      :storeurl
      t.text      :imageurl
      t.integer   :integer
      t.timestamps    null: true    
    end
  end
end

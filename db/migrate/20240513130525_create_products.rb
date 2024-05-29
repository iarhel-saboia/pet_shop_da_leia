class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :sale_price
      t.integer :quantity
      t.integer :for_dog_or_cat

      t.timestamps
    end
  end
end

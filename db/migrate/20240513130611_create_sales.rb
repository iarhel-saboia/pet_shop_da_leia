class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.belongs_to :client
      t.belongs_to :product
      t.integer :quantity
      t.float :total_value

      t.timestamps
    end
  end
end

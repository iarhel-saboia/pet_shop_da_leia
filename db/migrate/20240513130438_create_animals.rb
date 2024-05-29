class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.belongs_to :client
      t.string :name
      t.integer :age
      t.string :breed
      t.string :vaccines
      t.string :deseases

      t.timestamps
    end
  end
end

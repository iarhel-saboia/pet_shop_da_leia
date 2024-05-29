class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.float :balance
      t.string :name
      t.string :cpf
      t.string :cep
      t.string :adress
      t.integer :house_n
      t.string :add_inf

      t.timestamps
    end
  end
end

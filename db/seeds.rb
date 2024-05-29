# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Client.destroy_all
Animal.destroy_all
Product.destroy_all

client_1 = Client.create(name:"Beatriz F. Mendes", cpf:"123.456.789-00", cep:"64048-001", adress:"Rua Espectro Patronum", house_n:"1098", add_inf:"Casa de muro amarelo", balance:1000)
client_2 = Client.create(name:"Iarhel A. Sabóia", cpf:"123.456.789-01", cep:"64048-002", adress:"Av. Expeliarmus", house_n:"797", add_inf:"Ap. 302, Bl. 09", balance:1000)
client_3 = Client.create(name:"Samuel A. S. Borges", cpf:"123.456.789-02", cep:"64048-003", adress:"Av. Crucio", house_n:"997", add_inf:"Ap. 801", balance:1000)
client_4 = Client.create(name:"Lucca C. Araújo ", cpf:"123.456.789-03", cep:"64048-004", adress:"Rua. Vingardium Leviosa", house_n:"198", add_inf:"Casa de esquina", balance:1000)

Animal.create(client_id:client_1.id, name:"Leia", age:2, breed:"Border Collie", vaccines:"Carrapato", deseases:"Nenhuma")
Animal.create(client_id:client_2.id, name:"Cheetos", age:10, breed:"S.R.D", vaccines:"Raiva", deseases:"Nenhuma")
Animal.create(client_id:client_2.id, name:"Princesa", age:4, breed:"S.R.D", vaccines:"Raiva", deseases:"Nenhuma")
Animal.create(client_id:client_3.id, name:"Scar", age:6, breed:"Maltês", vaccines:"Carrapato, Raiva", deseases:"Nenhuma")
Animal.create(client_id:client_4.id, name:"Rompe Nuvem", age:6, breed:"Boxer", vaccines:"Carrapato, Raiva", deseases:"Nenhuma")

Product.create(name:"Ração Plus Ultra 10kg", sale_price:109.9, quantity:"250", for_dog_or_cat:0)
Product.create(name:"Ração Miau Miau K.R.L 10kg", sale_price:109.9, quantity:"250", for_dog_or_cat:1)
Product.create(name:"Tapete Higiênico 30un.", sale_price:59.9, quantity:"250", for_dog_or_cat:2)

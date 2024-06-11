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

client_1 = Client.create(client_photo: File.open(Rails.root.join('app', 'assets', 'images', 'Biaphoto.jpg')), name:"Beatriz F. Mendes", cpf:"123.456.789-00", cep:"64048-001", adress:"Rua Espectro Patronum", house_n:"1098", add_inf:"Casa de muro amarelo", balance:1000)

Animal.create(animal_photo: File.open(Rails.root.join('app', 'assets', 'images', 'Leia9.jpeg')), client_id:client_1.id, name:"Leia", age:2, breed:"Border Collie", vaccines:"Carrapato", deseases:"Nenhuma")

Product.create(product_photo: File.open(Rails.root.join('app', 'assets', 'images', 'raçao miau miau.jpg')), name:"Ração Miau Miau K.R.L 10kg", sale_price:109.9, quantity:"250", for_dog_or_cat:1)

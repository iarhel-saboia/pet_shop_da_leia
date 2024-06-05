class Product < ApplicationRecord
  has_one_attached :product_photo
  has_many :sales
  has_many :clients, through: :sales
end

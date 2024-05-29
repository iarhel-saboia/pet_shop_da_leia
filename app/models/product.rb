class Product < ApplicationRecord
  has_many :sales
  has_many :clients, through: :sales
end

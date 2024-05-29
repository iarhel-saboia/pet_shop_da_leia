class Client < ApplicationRecord
  has_many :animals, dependent: :destroy
  has_many :sales
  has_many :products, through: :sales
end

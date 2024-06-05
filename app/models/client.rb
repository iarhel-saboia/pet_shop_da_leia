class Client < ApplicationRecord
  has_one_attached :client_photo
  has_many :animals, dependent: :destroy
  has_many :sales
  has_many :products, through: :sales
end

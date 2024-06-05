class Animal < ApplicationRecord
  has_one_attached :animal_photo
  belongs_to :client
end

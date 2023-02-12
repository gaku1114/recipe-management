class Material < ApplicationRecord
  validates :name,    presence: true
  validates :dish_id, presence: true

  belongs_to :dish
end

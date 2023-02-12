class Dish < ApplicationRecord
  validates :dish_name, presence: true
  validates :user_id,   presence: true
  
  belongs_to :user
  belongs_to :genre
  has_many :materials
end

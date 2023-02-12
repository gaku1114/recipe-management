class Genre < ApplicationRecord
  validates :name,     presence: true
  validates :user_id,  presence: true

  has_many :dishes
  belongs_to :user
end

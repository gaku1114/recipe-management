class Genre < ApplicationRecord
  validates :name,     presence: true
  validates :user_id,  presence: true

  has_many :dishes, dependent: :nullify
  belongs_to :user
end

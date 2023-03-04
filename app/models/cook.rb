class Cook < ApplicationRecord
  validates :cook_date, presence: true
  validates :dish_id,   presence: true

  belongs_to :dish
end

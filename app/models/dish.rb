class Dish < ApplicationRecord
  validates :dish_name, presence: true, length: { maximum: 12 }
  validates :user_id,   presence: true
  validate :image_content_type, if: :was_attached?
  
  belongs_to :user
  belongs_to :genre, optional: true
  has_many :materials, dependent: :destroy
  has_many :cooks, dependent: :destroy
  has_one_attached :image

  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
    errors.add(:image, "は保存できません") unless image.content_type.in?(extension)
  end

  def was_attached?
    self.image.attached?
  end
end

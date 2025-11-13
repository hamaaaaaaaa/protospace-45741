class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  # バリデーション
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  # 画像必須
  validate :image_presence

  private

  def image_presence
    errors.add(:image, "を選択してください") unless image.attached?
  end
end

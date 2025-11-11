class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  # バリデーション
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  # 画像は添付されていればOK、なくても登録可能
  # validates :image, presence: true
end

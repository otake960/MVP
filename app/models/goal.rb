class Goal < ApplicationRecord
  belongs_to :user
  validates :target_value, presence: true, numericality: { greater_than: 0 }  # 0より大きい数値であることを確認
  validates :description, presence: true, length: { maximum: 500 }  # 最大500文字まで
end
class Goal < ApplicationRecord
  belongs_to :user
  has_many :goal_exercises, dependent: :destroy
  has_many :exercises, through: :goal_exercises

  # 説明は必ず入力させる
  validates :description, presence: true

  # 開始日と終了日のバリデーション
  validate :end_date_after_start_date

  private

  # 開始日が終了日より前であることを確認するカスタムバリデーション
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
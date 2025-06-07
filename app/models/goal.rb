class Goal < ApplicationRecord
  belongs_to :user
  has_many :goal_exercises, dependent: :destroy
  has_many :exercises, through: :goal_exercises

  validate :end_date_after_start_date

  accepts_nested_attributes_for :goal_exercises, allow_destroy: true

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def update_achievement
    if self.goal_exercises.all? { |ge| ge.achieved }
      self.update(achieved: true)
    end
  end
end
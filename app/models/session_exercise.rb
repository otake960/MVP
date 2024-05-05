class SessionExercise < ApplicationRecord
  belongs_to :training_session
  belongs_to :exercise

  validates :name, presence: true
  validates :weight, numericality: { greater_than_or_equal_to: 0 }
  validates :reps, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
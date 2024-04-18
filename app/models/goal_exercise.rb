class GoalExercise < ApplicationRecord
  belongs_to :goal
  belongs_to :exercise
  validates :target_weight, presence: true, numericality: true
  validates :repetitions, presence: true, numericality: { only_integer: true }
end
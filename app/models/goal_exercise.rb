class GoalExercise < ApplicationRecord
  belongs_to :goal
  belongs_to :exercise

  attribute :target_weight, :decimal
  attribute :repetitions, :integer
end

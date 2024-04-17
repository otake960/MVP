class Exercise < ApplicationRecord
    has_many :goal_exercises
    has_many :goals, through: :goal_exercises
end
  
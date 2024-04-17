class Goal < ApplicationRecord
  belongs_to :user
  has_many :goal_exercises
  has_many :exercises, through: :goal_exercises
end
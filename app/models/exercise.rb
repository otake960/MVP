class Exercise < ApplicationRecord
  has_many :session_exercises
  has_many :training_sessions, through: :session_exercises
  has_many :goal_exercises
  has_many :goals, through: :goal_exercises

  validates :name, presence: true
end
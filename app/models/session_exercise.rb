class SessionExercise < ApplicationRecord
  belongs_to :training_session
  belongs_to :exercise

  validates :name, presence: true
  validates :weight, presence: true, numericality: true
  validates :reps, presence: true, numericality: true
end
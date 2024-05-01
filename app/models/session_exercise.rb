class SessionExercise < ApplicationRecord
  belongs_to :training_session, foreign_key: "session_id"
  belongs_to :exercise

  validates :weight, :sets, :reps, presence: true
end
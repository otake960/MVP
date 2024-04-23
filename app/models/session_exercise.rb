class SessionExercise < ApplicationRecord
    belongs_to :session, class_name: "TrainingSession"
    belongs_to :exercise
  
    validates :weight, :sets, :reps, presence: true
  end
  
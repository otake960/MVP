# frozen_string_literal: true

class SessionExercise < ApplicationRecord
  belongs_to :training_session
  belongs_to :exercise  # ← optional: true を外して必須に戻す

  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :reps,   presence: true, numericality: { only_integer: true, greater_than: 0 }
end
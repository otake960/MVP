class TrainingSession < ApplicationRecord
    belongs_to :user
    has_many :session_exercises, dependent: :destroy
  
    validates :date, presence: true
  end
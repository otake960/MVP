class TrainingSession < ApplicationRecord
  belongs_to :user
  has_many :session_exercises, dependent: :destroy
  accepts_nested_attributes_for :session_exercises, allow_destroy: true

  validates :date, presence: true
end
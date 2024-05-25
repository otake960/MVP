class TrainingSession < ApplicationRecord
  belongs_to :user
  has_many :session_exercises, dependent: :destroy
  accepts_nested_attributes_for :session_exercises, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true

  validates :user, presence: true
  validates :date, presence: true
end

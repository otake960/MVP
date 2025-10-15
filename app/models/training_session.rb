# frozen_string_literal: true

class TrainingSession < ApplicationRecord
  belongs_to :user
  has_many :session_exercises, dependent: :destroy

  accepts_nested_attributes_for :session_exercises, allow_destroy: true, reject_if: :all_blank

  validates :date, presence: true
end

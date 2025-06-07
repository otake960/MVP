class Badge < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
  validates :level, presence: true
  validates :description, presence: true

  enum level: { beginner: 'beginner', intermediate: 'intermediate', advanced: 'advanced' }
end
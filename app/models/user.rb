class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :training_sessions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
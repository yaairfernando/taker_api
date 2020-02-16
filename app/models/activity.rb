class Activity < ApplicationRecord
  has_many :activity_logs
  has_many :assistants, through: :activity_logs
  has_many :babies, through: :activity_logs
end

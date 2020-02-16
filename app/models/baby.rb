class Baby < ApplicationRecord
  has_many :activity_logs
  has_many :activities, through: :activity_logs
end

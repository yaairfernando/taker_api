class ActivityLog < ApplicationRecord
  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity
  validates :baby_id, presence: true
  validates :activity_id, presence: true
  validates :assistant_id, presence: true
  validates :start_time, presence: true
  validates :stop_time, date: { allow_blank: true}, on: :create
  validates :stop_time, date: { after: Proc.new { :start_time }, allow_blank: false }, on: :update
end

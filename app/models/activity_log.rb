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
  validate :end_date_after_start_date?, on: :update

  scope :by_baby_id, lambda { |baby_id| includes(:baby, :activity, :assistant).where(:baby_id => baby_id)}
  scope :by_assistant_id, lambda { |assistant_id| includes(:baby, :activity, :assistant).where(:assistant_id => assistant_id)}
  scope :by_status_id, lambda { |status| includes(:baby, :activity, :assistant).where(:status => status)}

  scope :by_baby_and_status, lambda { |baby_id, status| includes(:baby, :activity, :assistant).by_baby_id(baby_id).where(:status => status)}
  scope :by_baby_and_assistant, lambda { |baby_id, assistant_id| includes(:baby, :activity, :assistant).by_baby_id(baby_id).where(:assistant_id => assistant_id)}
  scope :by_assistant_and_status, lambda { |assistant_id, status| includes(:baby, :activity, :assistant).by_assistant_id(assistant_id).where(:status => status)}

  scope :by_all, lambda { |baby_id, assistant_id, status| includes(:baby, :activity, :assistant).by_baby_id(baby_id).by_assistant_id(assistant_id).by_status_id(status)}

  def end_date_after_start_date?
    if TimeDifference.between(start_time, stop_time).in_minutes > 60
      errors.add :stop_time, "The babie's activities can not last more than 60 minutes..."
    end
  end
end

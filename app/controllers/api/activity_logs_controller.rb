module Api
  class ActivityLogsController < ApplicationController
    def index
      @activity_logs = ActivityLog.includes(:baby, :activity, :assistant).all
      @activity_logs = ActivityLog.includes(:baby, :activity, :assistant).all if params[:status].present? && params[:status] === "2"
      
      @activity_logs = ActivityLog.by_status_id(params[:status]) if params[:status].present? && params[:status] != "2"
      @activity_logs = ActivityLog.by_assistant_id(params[:assistant]) if params[:assistant].present?
      @activity_logs = ActivityLog.by_assistant_id(params[:assistant]) if params[:assistant].present? && params[:status].present? && params[:status] == "2"
      @activity_logs = ActivityLog.by_baby_id(params[:baby]) if params[:baby].present?
      @activity_logs = ActivityLog.by_baby_id(params[:baby]) if params[:baby].present? && params[:status].present? && params[:status] == "2"

      @activity_logs = ActivityLog.by_baby_and_status(params[:baby], params[:status]) if params[:baby].present? && params[:status].present? && params[:status] != "2"
      @activity_logs = ActivityLog.by_baby_and_assistant(params[:baby], params[:assistant]) if params[:baby].present? && params[:assistant].present?
      @activity_logs = ActivityLog.by_assistant_and_status(params[:assistant], params[:status]) if params[:assistant].present? && params[:status].present? && params[:status] != "2"
      @activity_logs = ActivityLog.by_all(params[:baby], params[:assistant], params[:status]) if params[:baby].present? && params[:assistant].present? && params[:status].present? && params[:status] != "2"
      @activity_logs.order('start_time DESC')
      activities = format_data(@activity_logs) if @activity_logs

      activities.sort! { |a, b| b[:start_time] <=> a[:stop_time] }
      activities = "There are no records that match your search" if activities === []
      count = activities.size if activities
      count = 0 if activities.class == String
      render json: {
        status: 200,
        count: count,
        message: "You have successfuly retrieved the list of ActivityLogs.",
        data: activities
      }
    end

    def create
    end

    def show
    end

    def update
    end

    private

    def format_data(activity_log)
      activities = []
      activity_log.each do |activity|
        act = {
          status: activity.status,
          id: activity.id,
          baby: activity.baby.name,
          assistant: activity.assistant.name,
          activity: activity.activity.name,
          start_time: activity.start_time.strftime('%Y %B %a %I:%M%p'),
          stop_time: activity.stop_time != nil ? "Terminada" : "Progreso",
          duration: activity.duration != nil ? activity.duration : "*"
        }
        activities << act
      end
      activities
    end
  end
end

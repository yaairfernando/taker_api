module Api
  class ActivityLogsController < ApplicationController
    before_action :get_activity_log, only: %i[update show]
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
      @activity_log = ActivityLog.new(activity_log_params)
      if @activity_log.save
        render json: {
          status: 200,
          message: "You've successfuly created a new log",
          data: @activity_log
        }
      else
        render json: {
          status: 422,
          message: "There was an error when trying to create a new log",
          data: @activity_log.errors
        }
      end
    end

    def show
      activity = {
        id: @activity_log.id,
        baby: @activity_log.baby.name,
        assistant: @activity_log.assistant.name,
        activity: @activity_log.activity.name,
        start_time: @activity_log.start_time.strftime('%Y %B %d %I:%M%p'),
        stop_time: @activity_log.stop_time != nil ? "Terminada" : "Progreso",
        duration: @activity_log.duration != nil ? @activity_log.duration : "*"
      }
      render json: {
        status: 200,
        message: "You've beed successfuly retrieve a log",
        data: activity
      }
    end

    def update
      @activity_log.duration = TimeDifference.between(@activity_log.start_time, ActiveSupport::TimeZone['UTC'].parse(params[:stop_time])).in_minutes
      @activity_log.status = 1
      if @activity_log.update(activity_log_params_update)
        render json: {
          status: 200,
          message: "You've beed successfuly update a log",
          data: @activity_log
        }
      else
        render json: {
          status: 422,
          message: "There was an error when trying to update a log",
          data: @activity_log.errors
        }
      end
    end

    private

    def get_activity_log
      @activity_log = ActivityLog.find(params[:id])
    end

    def activity_log_params
      params.require(:activity_log).permit(:baby_id, :assistant_id, :activity_id, :start_time, :status)
    end

    def activity_log_params_update
      params.require(:activity_log).permit(:stop_time, :comments, :status)
    end

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

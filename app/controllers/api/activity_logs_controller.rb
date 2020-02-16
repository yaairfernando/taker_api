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
      
      render json: {
        status: 200,
        message: "You have successfuly retrieved the list of ActivityLogs.",
        data: @activity_logs
      }
    end

    def create
    end

    def show
    end

    def update
    end
  end
end

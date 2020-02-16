module Api
  class ActivityLogsController < ApplicationController
    def index
      @activity_logs = ActivityLog.all
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

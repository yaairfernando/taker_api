module Api
  class BabyActivitiesController < ApplicationController
    def index
      @baby = Baby.find(params[:baby_id])
      activities = @baby.activity_logs
      arr = create_array(activities)
      render json: {
        status: 200,
        message: "You've successfuly get a list of baby activity logs",
        data: arr
      }
    end

    private

    def create_array activities
      arr = []
      activities.each do |act|
        activity = {
          id: act.id,
          baby_id: act.baby_id,
          assistant_name: act.assistant.name,
          start_time: act.start_time.to_time.iso8601,
          stop_time: act.stop_time.to_time.iso8601
        }
        arr << activity
      end
      arr
    end
  end
end

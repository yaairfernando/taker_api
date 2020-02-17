module Api
  class ActivitiesController < ApplicationController
    def index
      @activities = Activity.all
      activities = format_data(@activities)
      render json: {
        status: 200,
        message: "You have successfuly retrieved a list of Activities.",
        data: activities
      }
    end

    private

    def format_data activities
      act = []
      activities.each do |activity|
        item = {
          id: activity.id,
          name: activity.name,
          description: activity.description
        }
        act << item
      end
      act
    end
  end
end

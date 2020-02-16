module Api
  class ActivitiesController < ApplicationController
    def index
      @activities = Activity.all
      render json: {
        status: 200,
        message: "You have successfuly retrieved a list of Activities.",
        data: @activities
      }
    end
  end
end

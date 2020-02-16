module Api
  class AssistantsController < ApplicationController
    def index
      @assistants = Assistant.all
      render json: {
        status: 200,
        message: "You have successfuly retrieved a list of Assistants.",
        data: @assistants
      }
    end
  end
end
module Api
  class BabiesController < ApplicationController
    def index
      @babies = Baby.all
      render json: {
        status: 200,
        message: "You have successfuly retrieved a list of Babies.",
        data: @babies
      }
    end
  end
end
module Api
  class AssistantsController < ApplicationController
    def index
      @assistants = Assistant.all
      assistants = format_data(@assistants)
      render json: {
        status: 200,
        message: "You have successfuly retrieved a list of Assistants.",
        data: assistants
      }
    end

    private

    def format_data assistants
      arr = []
      assistants.each do |assistant|
        item = {
          id: assistant.id,
          name: assistant.name,
          group: assistant.group,
          address: assistant.address,
          phone: assistant.phone
        }
        arr << item
      end
      arr
    end
  end
end
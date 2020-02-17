module Api
  class BabiesController < ApplicationController
    def index
      @babies = Baby.all
      babies = format_data(@babies)
      render json: {
        status: 200,
        message: "You have successfuly retrieved a list of Babies.",
        data: babies
      }
    end

    private

    def format_data babies
      arr = []
      babies.each do |baby|
        item = {
          id: baby.id,
          name: baby.name,
          birthday: baby.birthday,
          mother: baby.mother_name,
          father: baby.father_name,
          address: baby.address,
          phone: baby.phone
        }
        arr << item
      end
      arr
    end
  end
end
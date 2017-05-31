module Api
  module V1
    class ToppingsController < ApplicationController

      def index
        @toppings = Topping.all
        render json: @toppings
      end

      def create
        topp = Topping.new topping_params
        if topp.save
          render json: {success: 'yeah success'}
        else
          render json: {error: 'ya bozo'}
        end
      end

      def topping_params
        params.permit(:name, :extra_cost )
      end

    end
  end
end

module Api
  module V1
    class ToppingsController < ApplicationController

      before_action :user_admin?, only: [:create]

      def index
        @toppings = Topping.all
        render json: @toppings
      end

      def create
        topp = Topping.new topping_params
        topp.roles_mask = 0b10 if vip_flag[:vip] == 'true'
        if topp.save
          render json: {success: 'yeah success'}
        else
          render json: {error: 'Validation Error'}, status: 400
        end
      end

      private

      def user_admin?
        user = User.find_by_id user_id[:id]
        if !user || !user.is?(:admin)
          render json: {error: 'ya bozo'}, status: 403
          return
        end
      end

      def topping_params
        params.permit(:name, :extra_cost)
      end

      def user_id
        params.permit(:id)
      end

      def vip_flag
        params.permit(:vip)
      end

    end
  end
end

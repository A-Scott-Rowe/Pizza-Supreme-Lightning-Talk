module Api
  module V1
    class ToppingsController < ApplicationController

      load_and_authorize_resource only: :index

      before_action :user_admin?, only: [:create]
      before_action :user_authenticated?, only: :index

      def index
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
        user = current_user
        if !user || !user.is?(:admin)
          bozo_message
          return
        end
      end

      def user_authenticated?
        if !user_id.key? :id || !current_user
          bozo_message
          return
        end
      end

      def current_user
        User.find_by_id user_id[:id]
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

      def bozo_message
        render json: {error: 'ya bozo'}, status: 403
      end

    end
  end
end

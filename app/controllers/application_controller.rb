class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions

  before_action :set_default_type

  private

  def set_default_type
    request.format = :json
  end
end

class ApplicationController < ActionController::API
  before_action :set_default_type

  private

  def set_default_type
    request.format = :json
  end
end

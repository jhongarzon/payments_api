class ApplicationController < ActionController::API
  include Graphiti::Rails::Responders
  before_action :authenticate_request

  attr_reader :current_client
  # helper_method :current_user

  private

  def authenticate_request
    @current_client = AuthorizeApiRequest.call(request.headers).result

    render json: { error: 'Not Authorized' }, status: 401 unless @current_client
  end
end

class AuthenticationController < ApplicationController
     skip_before_action :authenticate_request

    def authenticate
        command = AuthenticateClient.call(params[:username], params[:password])

        if command.success?
            render json: { auth_token: command.result }
        else
            render json: { error: command.errors }, status: :unauthorized
        end
    end
end

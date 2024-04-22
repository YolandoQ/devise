class ApplicationController < ActionController::API
    def index
        render json: { "info": "instructions" }, status: :ok
    end
    def not_found
        render json: { "info": "Page not found" }, status: :not_found
    end
end

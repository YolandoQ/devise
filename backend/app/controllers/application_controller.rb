class ApplicationController < ActionController::API
    def index
        render json: { "info": "instructions" }, status: :not_found
    end
    def not_found
        render json: { "info": "Page not found" }, status: :not_found
    end
end

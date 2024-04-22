module Api
    module V1
        class MotherboardsController < ApplicationController
            def index
                motherboards = Motherboard.all
                render json: motherboards
            end
        end
    end
end
module Api
    module V1
        class MemoriesController < ApplicationController
            def index
                memories = Memory.all
                render json: memories
            end
        end
    end
end
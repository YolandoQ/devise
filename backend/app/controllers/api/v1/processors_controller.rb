module Api
    module V1
        class ProcessorsController < ApplicationController
            def index
                processors = Processor.all
                render json: processors
            end
        end
    end
end  
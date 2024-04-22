module Api
    module V1
        class GraphicsCardsController < ApplicationController
            def index
                graphics_cards = GraphicsCard.all
                render json: graphics_cards
            end
        end
    end
end
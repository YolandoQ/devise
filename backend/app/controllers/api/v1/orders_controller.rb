module Api
    module V1
        class OrdersController < ApplicationController
            def index
                orders = Order.includes(computer_build: [:processor, :motherboard, :graphics_card, :memories])

                render json: orders.as_json(include: {
                    computer_build: {
                        include: {
                            processor: { only: [:id, :name, :brand] },
                            motherboard: { only: [:id, :name, :supported_processor, :memory_slots, :max_memory, :integrated_video] },
                            graphics_card: { only: [:id, :name] },
                            memories: { only: [:id, :name, :size] }
                        }
                    }
                }), status: :ok
            end
        end
    end
end  

# app/controllers/api/v1/computer_builds_controller.rb
module Api
  module V1
    class ComputerBuildsController < ApplicationController
      def create
        result = CreateComputerBuildService.call(build_params, params[:cpf])

        if result[:success]
          render json: {
            message: "Pedido criado com sucesso!",
            computer_build: result[:computer_build].as_json(computer_build_json_options),
            order: result[:order].as_json(except: [:customer_name, :created_at, :updated_at])
          }, status: :created
        else
          render json: { errors: result[:errors] }, status: :unprocessable_entity
        end
      end

      private

      def build_params
        params.require(:computer_build).permit(:processor_id, :motherboard_id, :graphics_card_id, memory_ids: [])
      end

      def computer_build_json_options
        {
          include: {
            processor: { only: [:id, :name, :brand] },
            motherboard: { only: [:id, :name, :supported_processor, :memory_slots, :max_memory, :integrated_video] },
            graphics_card: { only: [:id, :name] },
            memories: { only: [:id, :name, :size] }
          },
          except: [:created_at, :updated_at]
        }
      end
    end
  end
end

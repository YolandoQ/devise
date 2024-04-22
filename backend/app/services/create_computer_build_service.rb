class CreateComputerBuildService
    def self.call(params, cpf)
      new(params, cpf).call
    end
  
    def initialize(params, cpf)
      @params = params
      @cpf = cpf
    end
  
    def call
      ComputerBuild.transaction do
        computer_build = ComputerBuild.new(@params.slice(:processor_id, :motherboard_id, :graphics_card_id))
        computer_build.memories = Memory.find(@params[:memory_ids]) if @params[:memory_ids].present?
        return { success: false, errors: computer_build.errors.full_messages } unless computer_build.save
        
        computer_build.reload
        order = CreateOrderService.call(computer_build, @cpf)
        return { success: false, errors: order.errors.full_messages } unless order.persisted?
  
        { success: true, computer_build: computer_build, order: order }
      end
    rescue ActiveRecord::Rollback
      { success: false, error: "Não foi possível processar seu pedido." }
    end
  end
class CreateOrderService
  def self.call(computer_build, identifier)
    order = Order.create!(
      computer_build: computer_build,
      cpf: identifier
    )
    order
  end
end

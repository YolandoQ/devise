class AddCpfToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :cpf, :string, null: false
  end
end

class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.references :computer_build, null: false, foreign_key: true

      t.timestamps
    end
  end
end

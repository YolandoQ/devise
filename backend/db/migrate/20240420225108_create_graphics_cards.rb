class CreateGraphicsCards < ActiveRecord::Migration[7.1]
  def change
    create_table :graphics_cards do |t|
      t.string :name
      t.integer :memory

      t.timestamps
    end
  end
end

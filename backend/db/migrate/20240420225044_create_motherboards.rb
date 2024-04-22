class CreateMotherboards < ActiveRecord::Migration[7.1]
  def change
    create_table :motherboards do |t|
      t.string :name
      t.string :supported_processor
      t.integer :memory_slots
      t.integer :max_memory
      t.boolean :integrated_video

      t.timestamps
    end
  end
end

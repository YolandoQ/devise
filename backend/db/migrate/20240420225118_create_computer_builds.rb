class CreateComputerBuilds < ActiveRecord::Migration[7.1]
  def change
    create_table :computer_builds do |t|
      t.references :processor, null: false, foreign_key: true
      t.references :motherboard, null: false, foreign_key: true
      t.references :memory, null: false, foreign_key: true
      t.references :graphics_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end

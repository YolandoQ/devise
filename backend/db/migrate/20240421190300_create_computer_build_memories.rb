class CreateComputerBuildMemories < ActiveRecord::Migration[7.1]
  def change
    create_table :computer_build_memories do |t|
      t.references :computer_build, null: false, foreign_key: true
      t.references :memory, null: false, foreign_key: true

      t.timestamps
    end
  end
end

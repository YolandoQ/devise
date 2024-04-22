class RemoveMemoryIdFromComputerBuilds < ActiveRecord::Migration[7.1]
  def change
    remove_column :computer_builds, :memory_id, :integer
  end
end

class CreateProcessors < ActiveRecord::Migration[7.1]
  def change
    create_table :processors do |t|
      t.string :name
      t.string :brand

      t.timestamps
    end
  end
end

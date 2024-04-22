# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

processors_data = [
  { name: "Core i5", brand: "Intel" },
  { name: "Core i7", brand: "Intel" },
  { name: "Ryzen 5", brand: "AMD" },
  { name: "Ryzen 7", brand: "AMD" }
]

motherboards_data = [
  { name: "Asus ROG", supported_processor: "Intel", memory_slots: 2, max_memory: 16, integrated_video: false },
  { name: "Gigabyte Aorus", supported_processor: "AMD", memory_slots: 2, max_memory: 16, integrated_video: false },
  { name: "ASRock Steel Legend", supported_processor: "Intel,AMD", memory_slots: 4, max_memory: 64, integrated_video: true }
]

memories_data = [4, 8, 16, 32, 64].map { |size| { name: "Kingston HyperX", size: size } }

graphics_cards_data = [
  { name: "Evga GeForce RTX 2060", memory: 6 },
  { name: "Asus ROG Strix GeForce RTX 3060", memory: 6 },
  { name: "Gigabyte Radeon RX 6600 XT EAGLE", memory: 8 }
]

def create_seeds(model, data)
  data.each do |attributes|
    model.find_or_create_by!(attributes)
  end
end

create_seeds(Processor, processors_data)
create_seeds(Motherboard, motherboards_data)
create_seeds(Memory, memories_data)
create_seeds(GraphicsCard, graphics_cards_data)

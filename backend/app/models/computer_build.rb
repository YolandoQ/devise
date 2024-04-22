class ComputerBuild < ApplicationRecord
  belongs_to :processor
  belongs_to :motherboard
  has_many :computer_build_memories
  has_many :memories, through: :computer_build_memories
  belongs_to :graphics_card, optional: true

  validate :check_compatibility

  def check_compatibility
    if motherboard.nil? || processor.nil?
      errors.add(:base, "Componentes essenciais estão faltando.")
      return
    end

    unless motherboard.supported_brands.include?(processor.brand)
      errors.add(:base, "Processador e placa mãe incompatíveis. Placa mãe suporta: #{motherboard.supported_processor}, mas o processador é da marca: #{processor.brand}.")
    end

    if memories.empty?
      errors.add(:base, "Pelo menos uma memória RAM deve ser associada.")
    elsif memories.size > motherboard.memory_slots
      errors.add(:base, "Número de memórias excede a quantidade de slots disponíveis (#{motherboard.memory_slots} slots disponíveis).")
    end

    total_memory_size = memories.sum(&:size)
    if total_memory_size > motherboard.max_memory
      errors.add(:base, "A quantidade total de memória RAM (#{total_memory_size} GB) excede o máximo suportado pela placa mãe (#{motherboard.max_memory} GB permitido).")
    end

    if !motherboard.integrated_video && graphics_card.nil?
      errors.add(:base, "Uma placa de vídeo é necessária, pois a placa mãe não possui vídeo integrado.")
    end
  end
end

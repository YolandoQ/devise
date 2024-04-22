class Memory < ApplicationRecord
    has_many :computer_build_memories
    has_many :computer_builds, through: :computer_build_memories
end

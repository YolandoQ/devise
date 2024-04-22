class Motherboard < ApplicationRecord
    def supported_brands
        supported_processor.split(',').map(&:strip)
    end
end

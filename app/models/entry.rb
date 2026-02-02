class Entry < ApplicationRecord
    enum category: {
        study: 0,
        weight: 1,
        training: 2,
        accounting: 3,
        sleeping: 4
    }

    UNIT_MAP = {
        "study" => "時間",
        "weight" => "kg",
        "training" => "回",
        "accounting" => "円",
        "sleeping" => "時間"
    }.freeze

    def unit
        UNIT_MAP[category]
    end
    
    validates :category, presence: true
    validates :value, presence: true
    validates :recorded_at, presence: true
end

class Entry < ApplicationRecord
    enum category: {
        study: 0,
        weight: 1,
        training: 2,
        accounting: 3,
        sleeping: 4
    }

    validates :category, presence: true
    validates :value, presence: true
    validates :recorded_at, presence: true
end

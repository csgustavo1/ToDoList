class Task < ApplicationRecord
    has_many :items, -> { order(position: :asc) }

    enum priority: { baixa: 0, media: 1, alta: 2 }


end

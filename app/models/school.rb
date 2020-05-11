class School < ApplicationRecord
    # validates :name, presence: true

    has_one :team
    
end
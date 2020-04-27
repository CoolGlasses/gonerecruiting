class Athletics_Director < ApplicationRecord
    validates :name, presence: true

    belongs_to :school
        primary_key: :id,
        foreign_key: :school_id,
        class_name: :School
    
end

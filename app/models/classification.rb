class Classification < ApplicationRecord
    validates :name, presence: true

    has_many :conferences,
        primary_key: :id,
        foreign_key: :classification_id,
        class_name: :Conference
    
    has_many :schools, through: :conferences, source: :schools

end
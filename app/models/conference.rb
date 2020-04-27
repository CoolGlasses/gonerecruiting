class Conference < ApplicationRecord
    validates :name, presence: true

    belongs_to :classification,
        primary_key: :id,
        foreign_key: :classification_id,
        class_name: :Classification
    
    has_many :schools,
        primary_key: :id,
        foreign_key: :conference_id,
        class_name: :School
    
    
end
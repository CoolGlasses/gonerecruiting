class School < ApplicationRecord
    # validates :name, presence: true

    # belongs_to :team,
    #     primary_key: :osaa_school_id,
    #     foreign_key: :osaa_school_id,
    #     class_name: :Team
    
    # # belongs_to :conference
    # #     primary_key: :id,
    # #     foreign_key: :conference_id,
    # #     class_name: :Conference
    
    # has_many :players, through: :team, source: :players
    
end
class Team < ApplicationRecord
    # belongs_to :school,
    #     primary_key: :osaa_school_id,
    #     foreign_key: :osaa_school_id,
    #     class_name: :School

    # belongs_to :coach,
    #     primary_key: :id,
    #     foreign_key: :school_id,
    #     class_name: :Coach
    
    # has_many :players,
    #     primary_key: :id,
    #     foreign_key: :team_id,
    #     class_name: :Player
end
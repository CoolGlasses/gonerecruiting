class Player < ApplicationRecord
    # validates :name, presence: true
    # validates :team_id, presence: true

    # belongs_to :team, foreign_key: "id"
    # has_one :school, through: :team 

    def self.height_filter(user_input)
        where("height_inches >= #{user_input}")
    end

    def self.name_filter(user_input)
        where("LOWER(name) LIKE ?", "%#{user_input}%")
    end

    def self.school_filter(user_input)
        where("LOWER(school_name) LIKE ?", "%#{user_input}%")
    end

    def self.position_filter(user_input)
        where(position: user_input)
    end

    def self.grade_filter(user_input)
        where(grade: user_input)
    end
end
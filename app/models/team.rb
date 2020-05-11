class Team < ApplicationRecord
    has_one :school, foreign_key: "osaa_school_id"
    has_one :coach
end
require 'date'
class Cat < ApplicationRecord
    validates :birth_date, :name, :color, :sex, :description, presence: true
    COLORS=['red','black','white'].freeze
    SEX=['m','f'].freeze
    validates :color, inclusion: COLORS
    validates :sex, inclusion: SEX

    def age
        current_year=Date.today.year
        current_year-:birth_date.year
    end
end
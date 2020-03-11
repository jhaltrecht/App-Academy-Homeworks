require 'date'
class Cat < ApplicationRecord
    validates :birth_date, :name, :color, :sex, :description, presence: true
    COLORS=['red','black','white'].freeze
    SEX=['m','f'].freeze
    validates :color, inclusion: COLORS
    validates :sex, inclusion: SEX
    dependent: :destroy

    has_many :cat_rental_requests,
    class_name: "CatRentalRequest",
    foreign_key: :cat_id,
    primary_key: :id

    def age
        current_year=Date.today.year
        current_year-:birth_date.year
    end
end
class Person<ApplicationRecord
    validates :name,:house, presence: true
end

class Person<ApplicationRecord
    belongs_to :house,
    class_name:'House',
    foreign_key: :house_id,
    primary_key: :id

end
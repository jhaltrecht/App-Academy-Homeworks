class Toy < ApplicationRecord
    validates :name,:toyable_id,:toyable_type, presence: true
    validates :
    belongs_to :toyable, polymorphic: true

end

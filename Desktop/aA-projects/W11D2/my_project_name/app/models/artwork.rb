class Artwork<ApplicationRecord
    validates :title,:image_url,:artist_id, presence:true
    validates :artist_id,uniqueness: {scope: :title}

    belongs_to :artist,
    class_name: "User",
    primary_key: :id,
    foreign_key: :artist_id,
    dependent: :destroy

    has_many :artwork_shares,
    class_name: "ArtworkShare",
    foreign_key: :artwork_id,
    primary_key: :id
# return the set of users with whom an artwork has been shared.
    has_many :shared_viewers, 
    through:  :artwork_shares,
    source: :viewer,
    dependent: :destroy

end
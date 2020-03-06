class Artwork<ApplicationRecord
    validates :title,:image_url,:artist_id, presence:true
    validates :artist_id,uniqueness: {scope: :title}

    belongs_to :artist,
    class_name: "User",
    primary_key: :id,
    foreign_key: :artist_id

    belongs_to :artwork_shares,
    class_name: "ArtworkShare",
    foreign_key: :artwork_id,
    primary_key: :id
# return the set of artworks that have been shared with that user (not the set of artworks that a user has shared with others).
    has_many :shared_artworks, 
    through:  :artwork_shares,
    source: :viewer

end
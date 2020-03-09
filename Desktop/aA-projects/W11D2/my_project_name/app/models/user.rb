class User<ApplicationRecord
    validates :username,presence:true,uniqueness: true

    has_many :artworks,
    class_name: "Artwork",
    primary_key: :id,
    foreign_key: :artist_id

    has_many :artwork_shares,
    class_name: "ArtworkShare",
    foreign_key: :viewer_id,
    primary_key: :id
# return the set of artworks that have been shared with that user 
    has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

    has_many :comments,
    class_name: "Comment",
    foreign_key: :user_id,
    primary_key: :id


end
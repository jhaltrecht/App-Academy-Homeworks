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

end
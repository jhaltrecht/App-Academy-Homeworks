class Artwork<ApplicationRecord
    validates :title,:image_url,:artist_id, presence:true
    validates :artist_id,uniqueness: {scope: :title}
    
end
class Visit<ApplicationRecord
    validates :shortened_url_id, :user_id, presence: true
# will create a Visit object recording a visit from a User to the given ShortenedUrl.
    def self.record_visit!(user,shortened_url)
        Visit.create!(
            user_id: user.id
            shortened_url_id: shortened_url.id
             )
    end

    belongs_to :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

    belongs_to :shortened_url,
    class_name: "ShortenedUrl",
    foreign_key: :shortened_url_id,
    primary_key: :id




end
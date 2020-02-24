class ShortenedUrl<ApplicationRecord
    validates :short_url, :long_url, :submitted_user_id, presence: true
    validates :short_url, uniqueness: true

    def self.random_code
        new_short_url=SecureRandom.urlsafe_base64
            until !ShortenedURL.exists?(short_url: new_short_url)
                new_short_url=SecureRandom.urlsafe_base64
            end
             new_short_url
    end
    def self.create_new_shortened_url(user,long_url_input)
        ShortenedUrl.create!(
        short_url: ShortenedUrl.random_code,
        long_url: long_url_input,
        submitted_user_id: user.id
        )
    end
end


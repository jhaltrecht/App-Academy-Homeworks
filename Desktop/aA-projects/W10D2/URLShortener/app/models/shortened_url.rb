class ShortenedUrl<ApplicationRecord
    validates :short_url, :long_url, :submitted_user_id, presence: true
    validates :short_url, uniqueness: true

    def self.random_code
        new_short_url=SecureRandom.urlsafe_base64
            until !ShortenedUrl.exists?(short_url: new_short_url)
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
    belongs_to :submitter,
    class_name: 'User',
    foreign_key: :submitted_user_id,
    primary_key: :id

    has_many :visits,
    class_name: "Visit",
    foreign_key: :shortened_url_id,
    primary_key: :id

    has_many :taggings,
    class_name: "Tagging",
    foreign_key: :shortened_url_id,
    primary_key: :id

    has_many :tag_topics, through: :taggings, source: :tag_topic


    has_many :visitors, -> { distinct } , through: :visits, source: :visitor

    def num_clicks
        visits.count
    end
    def num_uniques
        # distinct proc takes care of this
        visitors.count
    end
    def num_recent_uniques
        visits
        .select('user_id')
        .where('created_at > ?', 10.minutes.ago)
        .distinct
        .count
    end
    # prevent users from submitting more than 5 URLs in a single minute

    def no_spamming
        submit_count=ShortenedUrl.select('COUNT(submitted_user_id)'.where('created_at>?',1.minute.ago)
        errors[:max]<<'too many urls submitted' if submit_count>=5
    end
#  limiting the number of total URLs non-premium users can submit to 5.
    def nonpremium_max

    end

end


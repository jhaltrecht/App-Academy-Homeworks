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
    dependent: :destroy


    has_many :taggings,
    class_name: "Tagging",
    foreign_key: :shortened_url_id,
    primary_key: :id
    dependent: :destroy


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
        submit_count=ShortenedUrl.select('COUNT(submitted_user_id)').where('created_at>?',1.minute.ago)
        errors[:max]<<'too many urls submitted' if submit_count>=5
    end
#  limiting the number of total URLs non-premium users can submit to 5.
    def nonpremium_max
        return if User.find(self.submitted_user_id).premium
        submit_count=ShortenedUrl.select('COUNT(submitted_user_id)')
        errors[:premium_max]<<'too many urls submitted for non-premium member' if submit_count>=5
    end
# moving on not enough time, solution below
    def self.prune(n)
        ShortenedUrl
      .joins(:submitter)
      .joins('LEFT JOIN visits ON visits.shortened_url_id = shortened_urls.id')
      .where("(shortened_urls.id IN (
        SELECT shortened_urls.id
        FROM shortened_urls
        JOIN visits
        ON visits.shortened_url_id = shortened_urls.id
        GROUP BY shortened_urls.id
        HAVING MAX(visits.created_at) < \'#{n.minute.ago}\'
      ) OR (
        visits.id IS NULL and shortened_urls.created_at < \'#{n.minutes.ago}\'
      )) AND users.premium = \'f\'")
      .destroy_all
    end

#     def no_spamming
#     last_minute = ShortenedUrl
#       .where('created_at >= ?', 1.minute.ago)
#       .where(submitter_id: submitter_id)
#       .length

#     errors[:maximum] << 'of five short urls per minute' if last_minute >= 5
#   end

#   def nonpremium_max
#     return if User.find(self.submitter_id).premium

#     number_of_urls =
#       ShortenedUrl
#         .where(submitter_id: submitter_id)
#         .length

#     if number_of_urls >= 5
#       errors[:Only] << 'premium members can create more than 5 short urls'
#     end
#   end
end


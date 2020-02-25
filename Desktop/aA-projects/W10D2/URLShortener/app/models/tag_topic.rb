class TagTopic<ApplicationRecord
    validates :name, presence: true
  
    has_many :taggings,
    class_name: "Tagging",
    foreign_key: :tag_topic_id,
    primary_key: :id 
    dependent: :destroy


    has_many :shortened_urls, through: :taggings, source: :shortened_url

    # returns the 5 most visited links for that TagTopic along with the number of times each link has been clicked.
# has_many :visits,
    # class_name: "Visit",
    # foreign_key: :shortened_url_id,
    # primary_key: :id

    def popular_links
        ShortenedUrl.joins(:visits)
        .group(:short_url)
        .order('COUNT(visits.id) DESC' )
        .select('short_url, COUNT(visits.id) as number_of_visits')
        .limit(5)
   end
end


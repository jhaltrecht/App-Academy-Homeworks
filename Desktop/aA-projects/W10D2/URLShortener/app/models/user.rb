class User<ApplicationRecord
    validates :email, presence: true,uniqueness:true


    has_many :submitted_urls,
    class_name: 'ShortenedUrl',
    foreign_key: :submitted_user_id,
    primary_key: :id



 end
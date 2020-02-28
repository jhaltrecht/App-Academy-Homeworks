class Response<ApplicationRecord

    validates :answer_choice_id,:user_id,presence: true

    belongs_to :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id

    belongs_to :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

    has_one :question, through: :answer_choice, source: :question
    # check that the respondent has not previously answered this question
    def not_duplicate_response
    errors[:user_id]<<"User already answered the question" if respondent_already_answered
    end

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
        sibling_responses.exist?(user_id: self.user_id)
    end

    def author_poll
    errors[:user_id]<<"author cannot answer their own poll"  if response.question.poll.author_id==self.user_id
    end
end
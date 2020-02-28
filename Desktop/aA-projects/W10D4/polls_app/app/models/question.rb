class Question < ApplicationRecord
    validates :text,:poll_id, presence: true

    belongs_to :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id


    has_many :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id
    
    has_many :responses, through: :answer_choices, source: :responses
# first with n+1 query
    def results
            choices_counts={}

        ans_choices=self.answer_choices

        ans_choices.each do |choice|
            choices_counts[choice.text]=choice.responses.count
        end
    end

    def includes_results
         choices_counts={}
         ans_choices=self.answer_choices.includes(:responses)
         ans_choices.each do |choice|
            choices_counts[choice.text]=choice.responses.length
        end

    end

    def results_SQL
       
        ans_choices=AnswerChoice.find_by_sql([<<-SQL, id])
        SELECT
            answer_choices.*,COUNT(responses.id) as response_count
        FROM 
            answer_choices
        LEFT JOIN responses
            on answer_choices.id=responses.answer_choice_id
        WHERE 
            answer_choices.question_id=?
        GROUP BY
            answer_choices.id
        SQL

        choices_counts={}
        ans_choices.each do |choice|
            choices_counts[choice.text]=choice.response_count
        end
        choices_counts

    end

    def results_no_SQL
       ans_choices=self.answer_choices
       .select('answer_choices.text','COUNT(responses.id) AS response_count')
       .left_outer_joins(:responses)
       .where('answer_choices.question_id=?',self.id)
       .group('answer_choices.id')
        choices_counts={}
        ans_choices.each do |choice|
            choices_counts[choice.text]=choice.response_count
        end
        choices_counts
    end



end
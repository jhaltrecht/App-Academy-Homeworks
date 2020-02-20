require_relative "questions_database"
class Questions_follows
    attr_accessor :id,:question_id,:author_id
    def self.all
        data=QuestionsDatabase.instance.execute("SELECT * FROM questions_follows")
        data.map{|datum| Questions_follows.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @author_id = options['author_id']
    end
# will lookup an id in the table, and return an object representing that row. 
# return an instance of our Question class NOT the data hash returned by the QuestionsDatabase!
    def self.find_by_id(id)
        quest_follow=QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT 
            *
        FROM
            questions_follows
        WHERE 
            id=?
        SQL
        return nil unless quest_follow.length>0
        Questions_follows.new(quest_follow.first)
    end

    def followers_for_question_id(question_id)
        # questions
        # # @id = options['id']
        # @title = options['title']
        # @body = options['body']
        # # @author_id = options['author_id']
        quest_follow=QuestionsDatabase.instance.execute(<<-SQL,question_id)
        SELECT 
            *
        FROM 
    end


end
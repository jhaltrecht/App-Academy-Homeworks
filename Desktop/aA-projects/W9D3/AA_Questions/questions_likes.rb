require_relative "questions_database"
class Questions_likes
    attr_accessor :id,:question_id,:author_id
    def self.all
        data=QuestionsDatabase.instance.execute("SELECT * FROM questions_likes")
        data.map{|datum| Questions_likes.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @author_id = options['author_id']
    end
# will lookup an id in the table, and return an object representing that row. 
# return an instance of our Question class NOT the data hash returned by the QuestionsDatabase!
    def self.find_by_id(id)
        quest_like=QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT 
            *
        FROM
            Questions_likes
        WHERE 
            id=?
        SQL
        return nil unless quest_like.length>0
        Questions_likes.new(quest_like.first)
    end

end
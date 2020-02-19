require_relative "questions_database"
require_relative "users"
class Questions
    attr_accessor :id,:title,:body,:author_id
    def self.all
        data=QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map{|datum| Questions.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @authors_id = options['authors_id']
    end
# will lookup an id in the table, and return an object representing that row. 
# return an instance of our Question class NOT the data hash returned by the QuestionsDatabase!
    def self.find_by_id(id)
        quest=QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT 
            *
        FROM
            questions
        WHERE 
            id=?

        SQL
        return nil unless quest.length>0
        Questions.new(quest.first)
    end

    def find_by_author_id(author_id)
        # returns user instance
        author=USERS.find_by_id(author_id)
        raise "#{author_id} not found in DB" unless author
        user_questions=QuestionsDatabase.instance.execute(<<-SQL,author.id)
        SELECT 
            *
        FROM
            questions
        WHERE 
            author_id=?
        user_questions.map{|quest| User.new(quest)}
    end

end
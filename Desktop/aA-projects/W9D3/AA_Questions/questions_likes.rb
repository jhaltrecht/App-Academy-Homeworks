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
        quest_like.map{|quest|Questions_likes.new(quest)}
    end

    def self.likers_for_question_id(question_id)
         # USERS
        # @id = options['id']
        # @fname = options['fname']
        # @lname = options['lname']
        quest_like=QuestionsDatabase.instance.execute(<<-SQL,question_id)
        SELECT 
            *
        FROM
            Questions_likes
        JOIN 
            users on users.id=quest_like.author_id
        WHERE 
            question_id=?
        SQL
        return nil unless quest_like.length>0
        quest_like.map{|quest|Questions_likes.new(quest)}
    end

    def self.num_likes_for_question_id(question_id)
        quest_like=QuestionsDatabase.instance.execute(<<-SQL,question_id)
        SELECT 
            count(*) as likes
        FROM
            questions_likes
        JOIN 
            questions on question.id=questions_likes.question_id
        WHERE 
            question_id=?
        SQL
        return "invalid question id" unless quest_like.length>0
        quest_like.map{|quest|Questions_likes.new(quest)}
    end

    def self.liked_questions_for_user_id(author_id)
        quest_like=QuestionsDatabase.instance.execute(<<-SQL,author_id)
        SELECT 
            *
        FROM
            questions_likes
        JOIN 
            questions on question.id=questions_likes.question_id
        WHERE 
            author_id=?
        SQL
        raise "invalid question id" unless quest_like.length>0
        quest_like.map{|quest|Questions_likes.new(quest)}
    end


end
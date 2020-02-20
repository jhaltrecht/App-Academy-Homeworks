 require_relative "questions_database"
 require_relative 'questions_follows'
 require_relative 'questions'
 require_relative 'replies'
class Users
    attr_accessor :id,:fname,:lname
    def self.all
        data=QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map{|datum| Users.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
# will lookup an id in the table, and return an object representing that row. 
# return an instance of our Question class NOT the data hash returned by the QuestionsDatabase!
    def self.find_by_id(id)
        user=QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT 
            *
        FROM
            users
        WHERE 
            id=?
        SQL
        return nil unless user.length>0
        Users.new(user.first)
    end

    def self.find_by_name(fname, lname)
        user=QuestionsDatabase.instance.execute(<<-SQL,fname,lname)
        SELECT 
            *
        FROM
            users
        WHERE 
            fname=? AND lname=?
        SQL
        raise 'invalid name' unless user.length>0
        Users.new(user.first)
    end

    def authored_questions 
            Questions.find_by_author_id(id)
    end

    def authored_replies
            Replies.find_by_user_id(id)
    end
        
    def followed_questions
        Questions_follows.followed_questions_for_user_id(id)
    end
    
    def liked_questions
        Questions_likes.liked_questions_for_user_id(id)
    end

    def average_karma
        user=QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT
            *
        FROM 
            question_likes
        JOIN 
            questions on question.id=questions_likes.question_id
    end

end

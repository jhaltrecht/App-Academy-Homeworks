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
# Avg number of likes for a User's questions.
    def average_karma
        # QUESTIONS
        #   @id = options['id']
        # @title = options['title']
        # @body = options['body']
        # @author_id = options['author_id']

        # Questions_likes
        #  @id = options['id']
        # @question_id = options['question_id']
        # @author_id = options['author_id']

        user=QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT
            CAST(COUNT(question_likes.id) as FLOAT)/COUNT(distinct(questions.id)) as average_karma
        FROM 
            questions
        LEFT JOIN 
            questions_likes 
        ON question.id=questions_likes.question_id
        WHERE 
            questions.author_id=?
        SQL
        raise 'invalid id' if user.length==0
         Users.new(user.first)
    end


  def save
    update if @id
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end

end

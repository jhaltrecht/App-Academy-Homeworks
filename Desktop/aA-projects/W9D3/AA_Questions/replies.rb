require_relative "questions_database"
class Replies
    attr_accessor :id,:questions_id,:parent_replies_id,:users_id,:body
    def self.all
        data=QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map{|datum| Users.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @questions_id = options['questions_id']
        @parent_replies_id=options['parent_replies_id']
        @users_id = options['users_id']
        @body=options['body']
    end
# will lookup an id in the table, and return an object representing that row. 
# return an instance of our Question class NOT the data hash returned by the QuestionsDatabase!
    def self.find_by_id(id)
        reply=QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT 
            *
        FROM
            replies
        WHERE 
            id=?
        SQL
        return nil unless reply.length>0
        Replies.new(reply.first)
    end
    # used to find info on replies table
    # def self.find_by_user_id(user_id)
    #      user=USERS.find_by_id(user_id)
    #     raise "#{user_id} not found in DB" unless user
    #     user_info=QuestionsDatabase.instance.execute(<<-SQL,user.id)
    #     SELECT 
    #         *
    #     FROM
    #         replies
    #     WHERE 
    #         user_id=?
    #     user_info.map{|info| User.new(info)}
    # end
    # end

    def self.find_by_user_id(user_id)
    replies_data = QuestionsDatabase.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    replies_data.map { |reply_data| Reply.new(reply_data) }
  end
end

def self.find_by_question_id(question_id)
   replies_data = QuestionsDatabase.execute(<<-SQL, question_id)
     SELECT
       *
     FROM
       replies
     WHERE
       question_id = ?
   SQL

   replies_data.map { |reply_data| Reply.new(reply_data) }
 end

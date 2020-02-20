require_relative "questions_database"
require_relative 'users'
class Replies
    attr_accessor :id,:question_id,:parent_reply_id,:author_id,:body
    def self.all
        data=QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map{|datum| Replies.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id=options['parent_reply_id']
        @author_id = options['author_id']
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
        raise "invalid id" unless reply.length>0
        Replies.new(reply.first)
    end
    # used to find info on replies table
    # def self.find_by_author_id(author_id)
    #      user=USERS.find_by_id(author_id)
    #     raise "#{author_id} not found in DB" unless user
    #     user_info=QuestionsDatabase.instance.execute(<<-SQL,user.id)
    #     SELECT 
    #         *
    #     FROM
    #         replies
    #     WHERE 
    #         author_id=?
    #     user_info.map{|info| User.new(info)}
    # end
    # end

    def self.find_by_user_id(author_id)
    replies_data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL
                    raise 'invalid id' unless replies_data.length>0

    replies_data.map { |reply_data| Replies.new(reply_data) }
    end


    def self.find_by_question_id(question_id)
    replies_data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
        *
        FROM
        replies
        WHERE
        question_id = ?
    SQL
                raise 'invalid id' unless replies_data.length>0
    replies_data.map { |reply_data| Replies.new(reply_data) }
    end

    def author
        Users.find_by_id(author_id)
    end

    def question
        Questions.find_by_id(question_id)
    end

    def parent_reply
        replies_data = QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id)
        SELECT
        *
        FROM
        replies
        WHERE
        id = ?
    SQL
    raise 'invalid id' unless replies_data.length>0
    replies_data.map { |reply_data| Replies.new(reply_data) }
    end

    def child_replies
        replies_data = QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id)
        SELECT
        *
        FROM
        replies
        WHERE
        parent_reply_id = ?
    SQL
    raise 'invalid id' unless replies_data.length>0
    replies_data.map { |reply_data| Replies.new(reply_data) }
    end


  def save
    update if @id
    QuestionsDatabase.instance.execute(<<-SQL,@question_id,@parent_reply_id,@author_id,@body)
      INSERT INTO
        replies (question_id,parent_reply_id,author_id,body)
      VALUES
        (?,?,?,?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL,@question_id,@parent_reply_id,@author_id,@body,@id)
      UPDATE
        replies
      SET
        @question_id=?,@parent_reply_id=?,@author_id=?,@body=?
       WHERE
        id = ?
    SQL
  end
end

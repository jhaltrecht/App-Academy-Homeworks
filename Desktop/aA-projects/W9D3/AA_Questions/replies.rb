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

end
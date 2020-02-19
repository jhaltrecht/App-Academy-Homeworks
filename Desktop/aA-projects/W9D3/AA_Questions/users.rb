 require_relative "questions_database"
class Users
    attr_accessor :id,:fname,:lname
    def self.all
        data=QuestionsDatabase.instance.execute("SELECT * FROM questions")
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

    def find_by_name(fname, lname)

    end

end

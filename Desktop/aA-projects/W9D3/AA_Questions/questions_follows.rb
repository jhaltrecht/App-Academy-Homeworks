require_relative "questions_database"
class Questions_follows
    attr_accessor :id,:questions_id,:users_id
    def self.all
        data=QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map{|datum| Users.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @questions_id = options['questions_id']
        @users_id = options['users_id']
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

end
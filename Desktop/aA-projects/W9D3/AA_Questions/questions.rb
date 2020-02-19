require_relative "questions_database"
class Questions
    def self.all
        data=QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map{|datum| Questions.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @playwright_id = options['playwright_id']
    end
will lookup an id in the table, and return an object representing that row. 
For example, our Question::find_by_id should return an instance of our Question class NOT the data hash returned by the QuestionsDatabase!
    def self.find_by_id
        
    end

end
require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def find_by_title(title)
      play=PlayDBConnection.instance.execute(<<-SQL,title)
     SELECT 
      *
     FROM 
      plays
      WHERE
      self.title=?
      return nil if play.length==0
      SQL
      Play.new(play.first)

  end
# returns all plays written by a playwright
  def find_by_playwright(name)
    # get name and year of playwright
     playwright=Playwright.find_by_name(name)
    #  confirm that name is valid
     raise "invalid name" unless playwright
    plays=PlayDBConnection.instance.execute(<<-SQL,playwright)
     SELECT 
      * 
     FROM 
      plays
     WHERE
     playwright_id=playwright.id
    SQL
        plays.map { |play| Play.new(play) }
  end

end

class Playwright
  attr_accessor :id, :name, :birth_year
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def find_by_name(name)
   writer=PlayDBConnection.instance.execute(<<-SQL,name)
     SELECT 
      * 
     FROM 
      playwrights
     WHERE
     playwrights.name=?
     return nil if writer.length==0
     Playwright.new(writer.first)
    SQL
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name,self.birth_year)
      INSERT INTO
        playwrights (name,birth_year)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end
  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name,self.birth_year,self.id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end
  # return all plays written by playwright
  def get_plays
    plays=PlayDBConnection.instance.execute(<<-SQL, self.id)
      SELECT
        *
      FROM
       plays
      WHERE
      playwright_id=?
    SQL
        plays.map { |play| Play.new(play) }


  end


end
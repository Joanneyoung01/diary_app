require 'pg'

class Diary_entry 

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_test')
    else
      connection = PG.connect(dbname: 'diary')
    end

    result = connection.exec("SELECT * FROM diary_entries")
    result.map { |entry| entry['title'] }
  end

  def self.create(title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_test')
    else
      connection = PG.connect(dbname: 'diary')
    end
  
    connection.exec("INSERT INTO diary_entries (title) VALUES('#{title}')")
  end
end
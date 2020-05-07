class Diary_entry 

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary')
    else
      connection = PG.connect(dbname: 'diary_test')
    end

    result = connection.exec("SELECT * FROM diary_entries")
    result.map { |entry| entry['title'] }
  end
end
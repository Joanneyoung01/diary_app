class Diary_entry 

  def self.all
    connection = PG.connect(dbname: 'diary')
    result = connection.exec("SELECT * FROM diary_entries")
    result.map { |entry| entry['title'] }
  end
end
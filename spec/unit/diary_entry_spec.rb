require 'spec_helper'
require 'diary_entry'

# describe ".new" do
#   it "saves a diary entry" do
#     Diary = Diary_entry.create(title: 'test title', entry: 'test entry')
#   end
# end

describe ".all" do
  it "returns a list of entries" do
    connection = PG.connect(dbname: 'diary_test')
    diary_entries = Diary_entry.all

    #load in the test data
    connection.exec("INSERT INTO diary_entries (title) VALUES ('Day one');")
    connection.exec("INSERT INTO diary_entries (title) VALUES ('Day two');")
    connection.exec("INSERT INTO diary_entries (title) VALUES ('Day three');")
   
    expect(diary_entries ).to include "Day one"
    expect(diary_entries ).to include "Day two"
    expect(diary_entries ).to include "Day three"
  end
end

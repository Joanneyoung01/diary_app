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
    connection.exec("INSERT INTO diary_entries (title) VALUES ('day one');")
    connection.exec("INSERT INTO diary_entries (title) VALUES ('day two');")
    connection.exec("INSERT INTO diary_entries (title) VALUES ('day three');")
   
    expect(diary_entries).to include "day one"
    expect(diary_entries).to include "day two"
    expect(diary_entries).to include "day three"
  end
end

describe ".create" do
  it "creates a new diary entry" do
    Diary_entry.create(title: 'example')
    expect(Diary_entry.all).to include 'example'
  end
end

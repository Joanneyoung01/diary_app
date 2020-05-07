require 'spec_helper'
require 'diary_entry'

# describe ".new" do
#   it "saves a diary entry" do
#     Diary = Diary_entry.create(title: 'test title', entry: 'test entry')
#   end
# end

describe ".all" do
  it "returns a list of entries" do
    diary_entries = Diary_entry.all
   
    expect(diary_entries ).to include "Day one"
    expect(diary_entries ).to include "Day two"
  end
end

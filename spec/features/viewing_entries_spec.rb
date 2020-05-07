# in spec/features/viewing_bookmarks_spec.rb
require 'pg'

feature 'Viewing entries' do
  scenario 'A user can see entries' do
    connection = PG.connect(dbname: 'diary_test')

    # Add the test data
    Diary_entry.create(title: "day one")
    Diary_entry.create(title: "day two")
    Diary_entry.create(title: "day three")

    visit('/diary')

    expect(page).to have_content "day one"
    expect(page).to have_content "day two"
    expect(page).to have_content "day three"
  end
end

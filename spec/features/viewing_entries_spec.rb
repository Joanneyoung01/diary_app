# in spec/features/viewing_bookmarks_spec.rb
require 'pg'

feature 'Viewing entries' do
  scenario 'A user can see entries' do
    connection = PG.connect(dbname: 'diary_test')

    # Add the test data
    connection.exec("INSERT INTO diary_entries (title) VALUES ('day one');")
    connection.exec("INSERT INTO diary_entries (title) VALUES ('day two');")
    connection.exec("INSERT INTO diary_entries (title) VALUES ('day three');")

    visit('/diary')

    expect(page).to have_content "day one"
    expect(page).to have_content "day two"
    expect(page).to have_content "day three"
  end
end

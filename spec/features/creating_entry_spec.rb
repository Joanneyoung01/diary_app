require 'spec_helper'
require 'pg'

feature "create diary entry" do
  scenario "user can create new diary entries" do
    visit("/diary/new")
    # fill_in 'title', with: 'Day one'
    # fill_in 'entry', with: 'This is my first entry'
    # click_button('submit')

    expect(page).to have_content('Day one', 'This is my first entry')
  end
end
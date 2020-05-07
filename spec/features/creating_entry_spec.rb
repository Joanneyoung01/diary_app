require 'spec_helper'
require 'pg'

feature 'create diary entry' do
  scenario 'user can create new diary entries' do
    visit('/diary/new')
    fill_in('title', with: 'day one')
    click_button('Submit')

    expect(page).to have_content 'day one'
  end
end
require 'rails_helper'

describe 'Guest Book displays correctly', :type => :feature do

  it 'checks for breadcrumbs on the main guest book entry page', :js => true do
    visit guest_book_entries_path
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks the easy challenge with the wrong info', :js=> true do
    visit new_guest_book_entry_path
    within("#challengeForm") do
      fill_in 'challenge', with: 'klopper'
    end
    find(:css,"#challengeButton").click
    find(:css, '#challengeWarning')
    expect(page).to have_content "Please check your spelling, that's incorrect."
  end

  it 'checks the easy challenge with the correct info', :js=> true do
    visit new_guest_book_entry_path
    within("#challengeForm") do
      fill_in 'challenge', with: 'koper'
    end
    find(:css,"#challengeButton").click
    find(:css, '#formContainerText')
    expect(page).to have_content "Add an entry to Peter's Guest Book."
  end


end

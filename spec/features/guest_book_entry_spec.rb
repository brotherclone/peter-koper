require 'rails_helper'

describe 'Guest Book displays correctly', :type => :feature do

  it 'checks for breadcrumbs on the main guest book entry page', :js => true do
    visit guest_book_entries_path
    expect(page).to have_css('ul.breadcrumbs')
  end


end

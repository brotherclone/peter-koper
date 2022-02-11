require 'rails_helper'

describe 'Back Stage displays correctly', :type => :feature do

  it 'checks for a breadcrumbs', :js => true do
    visit back_stage_path
    expect(page).to have_css('ul.breadcrumbs')
    visit back_stage_style_guide_path
    expect(page).to have_css('ul.breadcrumbs')
    visit back_stage_dev_info_path
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks headings', :js => true  do
    visit back_stage_path
    expect(page).to have_content('Back Stage')
    visit back_stage_style_guide_path
    expect(page).to have_content('Back Stage')
    expect(page).to have_content('Style Guide')
    expect(page).to have_content('Typography')
    expect(page).to have_content('Icons')
    expect(page).to have_content('Colors')
    visit back_stage_dev_info_path
    expect(page).to have_content('Back Stage')
    expect(page).to have_content('Developer Info')
  end

end

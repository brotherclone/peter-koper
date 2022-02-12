require 'rails_helper'

describe 'Back Stage displays correctly', :type => :feature do

  it 'checks for breadcrumbs on the main back stage page', :js => true do
    visit back_stage_path
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for breadcrumbs on the style guide', :js => true do
    visit back_stage_style_guide_path
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for breadcrumbs on the dev info page', :js => true do
    visit back_stage_dev_info_path
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks headings on the main back stage page', :js => true  do
    visit back_stage_path
    expect(page).to have_content('Back Stage')
  end

  it 'checks headings on the style guide', :js => true  do
    visit back_stage_style_guide_path
    expect(page).to have_content('Style Guide')
    expect(page).to have_content('TYPOGRAPHY')
    expect(page).to have_content('ICONS')
    expect(page).to have_content('COLORS')
  end

  it 'checks headings on the dev info page', :js => true  do
    visit back_stage_dev_info_path
    expect(page).to have_content('Back Stage')
    expect(page).to have_content('Developer Info')
  end

  it 'checks for links from back stage to sub pages', :js => true do
    visit back_stage_path
    expect(page).to have_selector(:css, 'a[href="/back-stage/dev-info"]')
    expect(page).to have_selector(:css, 'a[href="/back-stage/style-guide"]')
  end

end

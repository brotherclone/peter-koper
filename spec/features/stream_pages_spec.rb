require 'rails_helper'

describe 'Stream Pages displays correctly', :type => :feature do

  it 'checks for breadcrumbs on the category page', :js => true do
    category = Category.create!(name: "feature test")
    visit category_path(category)
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for breadcrumbs on the tag page', :js => true do
    tag = Tag.create!(name: "feature test")
    visit tag_path(tag)
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for breadcrumbs on the sub-category page', :js => true do
    category = Category.create!(name: "feature test")
    sub_category = SubCategory.create!(name: "feature test", category_id: category.id)
    visit category_sub_category_path(category, sub_category)
    expect(page).to have_css('ul.breadcrumbs')
  end

end
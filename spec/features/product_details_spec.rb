require 'rails_helper'

RSpec.feature "Visitor Navigates to Individual Product", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )      
    end
  end

  scenario "They see all relevant details of individual product from the products page" do
    visit root_path
    save_screenshot
    # find('a.btn-default', match: :first).click
    find_link("Details", match: :first).trigger("click")
    expect(page).to have_css 'section.products-show'
    save_screenshot
  end



end

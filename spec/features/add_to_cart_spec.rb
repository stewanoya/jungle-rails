require 'rails_helper'

RSpec.feature "Can add product to cart", type: :feature, js: true do
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


  scenario "Visitor clicks add to cart and nav will display number of items accordingly" do
    
    visit root_path
    find_button("Add", match: :first).trigger("click")
    expect(page).to have_content('My Cart (1)')
    save_and_open_screenshot
  end



end

require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'will save if every field is filled' do      
      category = Category.new name: "food"
      category.save

      product = category.products.create({
        name:'Hamburger',
        description: 'is delicious',
        quantity: 1,
        price: 2.89,
      })
      expect(product).to be_valid
    end
 
    
    it 'validates presence of name' do
      category = Category.new name: "food"
      category.save

      product = category.products.create({
        name: nil,
        description: 'is delicious',
        quantity: 1,
        price: 2.89,
      })
      expect(product).to_not be_valid
      puts ""
      print "Validation error in array -> " 
      print product.errors.full_messages
    end

    it 'validates presence of price' do
      category = Category.new name: "food"
      category.save

      product = category.products.create({
        name: "Hamburger",
        description: 'is delicious',
        quantity: 1,
        price: nil,
      })
      expect(product).to_not be_valid
      puts ""
      print "Validation error in array -> " 
      print product.errors.full_messages

    end

    it 'validates presence of quantity' do
      category = Category.new name: "food"
      category.save

      product = category.products.create({
        name: "Hamburger",
        description: 'is delicious',
        quantity: nil,
        price: 2.89,
      })
      expect(product).to_not be_valid
      puts ""
      print "Validation error in array -> " 
      print product.errors.full_messages
    end

    it 'validates presence of category' do
      category = Category.new name: "food"
      category.save

      product = Product.create({
        name: "Hamburger",
        description: 'is delicious',
        quantity: 1,
        price: 2.89,
        category: nil
      })
      expect(product).to_not be_valid
      puts ""
      print "Validation error in array -> " 
      print product.errors.full_messages
   end


  end

end

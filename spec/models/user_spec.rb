require 'rails_helper'

RSpec.describe User, type: :model do
  

  describe "Validations" do
    
    it "should work if every field is filled out correctly" do
      user = User.new(
        name: "Stew",
        email: "test@test.com",
        password: "123",
        password_confirmation: "123",
        )
      expect(user).to be_valid
    end

    it "should fail if the passwords do no match" do
      user = User.new(
        name: "Stew",
        email: "test@test.com",
        password: "123",
        password_confirmation: "1234",
        )
      expect(user).not_to be_valid
      puts ""
      print "Validation error in array -> " 
      print user.errors.full_messages

    end

    it "should validate email uniquness" do
      user1 = User.new(
        name: "Stew",
        email: "test@test.com",
        password: "123",
        password_confirmation: "123",
        )
      user1.save!
      user2 = User.new(
        name: "Stew",
        email: "TEST@TEST.com",
        password: "123",
        password_confirmation: "123",
        )
      expect(user2).not_to be_valid
      puts ""
      print "Validation error in array -> " 
      print user2.errors.full_messages
    end

    it "should validate the Email Exists" do
      user = User.new(
        name: "Stew",
        email: nil,
        password: "123",
        password_confirmation: "123",
        )
        expect(user).not_to be_valid
        puts ""
        print "Validation error in array -> " 
        print user.errors.full_messages
  
    end

    it "should validate the Name Exists" do
      user = User.new(
        name: nil,
        email: "test@test.com",
        password: "123",
        password_confirmation: "123",
        )
        expect(user).not_to be_valid
        puts ""
        print "Validation error in array -> " 
        print user.errors.full_messages
    end

    it "should validate password length minimum" do
      user = User.new(
        name: "Stew",
        email: "test@test.com",
        password: "12",
        password_confirmation: "12",
        )
        expect(user).not_to be_valid
        puts ""
        print "Validation error in array -> " 
        print user.errors.full_messages
    end
  end


end

require 'rails_helper'

RSpec.describe Dog, :type => :model do

	describe "is invalid without a name" do
		it "name" do
		dog = build(:dog)
      	dog.name = nil
      	expect(dog).to be_invalid
      end
  	end

	describe "is invalid without a birthday" do
		it "birthday" do
		dog = build(:dog)
      	dog.birthday = nil
      	expect(dog).to be_invalid
      end
  	end

  		describe "is invalid without an email" do
		it "email" do
		dog = build(:dog)
      	dog.email = nil
      	expect(dog).to be_invalid
      end
  	end

  		describe "is invalid without a city" do
		it "city" do
		dog = build(:dog)
      	dog.city = nil
      	expect(dog).to be_invalid
      end
  	end

  		describe "is invalid without a state" do
		it "state" do
		dog = build(:dog)
      	dog.state = nil
      	expect(dog).to be_invalid
      end
  	end

end

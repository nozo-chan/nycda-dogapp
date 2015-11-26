require 'rails_helper'

RSpec.describe Dog, :type => :model do

  describe "is invalid without a " do
    it "name" do
      dog = build(:dog)
      dog.name = nil
      expect(dog).to be_invalid
    end

    it "birthday" do
      dog = build(:dog)
      dog.birthday = nil
      expect(dog).to be_invalid
    end

    it "email" do
      dog = build(:dog)
      dog.email = nil
      expect(dog).to be_invalid
    end

    it "city" do
      dog = build(:dog)
      dog.city = nil
      expect(dog).to be_invalid
    end
    
    it "state" do
      dog = build(:dog)
      dog.state = nil
      expect(dog).to be_invalid
    end
  end

  describe " testing for Dog methods " do 
    it "age" do
      dog = build(:dog) 
      expect(dog.age).to eq(3)
    end

    it "location" do
      dog = build(:dog) 
      expect(dog.location).to eq("New York, NY")
    end
    
    it "age_in_dog_years" do
      dog = build(:dog)
      expect(dog.age_in_dog_years).to eq(21)
    end   
  end

end

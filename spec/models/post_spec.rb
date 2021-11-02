require 'rails_helper'

RSpec.describe Post, type: :model do
  object = FactoryBot.build :post

  describe "title" do

    it "has valid data" do
      expect(object).to be_valid
    end

    it "is missing" do
      object.title = nil
      expect(object).to_not be_valid
    end

    it "is too short" do
      object.title = "xx"
      expect(object).to_not be_valid
    end

    it "is too long" do
      # Create index and append to title until it is longer than 70 chars
      index = 0
      while index <=71
        object.title += "x"
        index += 1
      end
      # Check
      expect(object).to_not be_valid
    end

  end

  describe "description" do

    it "has valid data" do
      object.title = "Title" # return title to valid value
      expect(object).to be_valid
    end

    it "is missing" do
      object.description = nil
      expect(object).to_not be_valid
    end

  end

end

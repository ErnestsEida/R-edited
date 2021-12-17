require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.build :post }

  describe "is valid" do

    it "with title and description present" do
      post.valid?
      puts post.errors
      expect(post).to be_valid
    end
  end

  describe "is not valid" do

    it "with title missing" do
      post.title = nil
      expect(post).to_not be_valid
    end

    it "with title shorter than 3 chars" do
      post.title = "x"
      expect(post).to_not be_valid
    end

    it "with title longer than 70 chars" do
      post.title = "x" * 71
      expect(post).to_not be_valid
    end

    it "with content missing" do
      post.content = nil
      expect(post).to_not be_valid
    end

  end

end

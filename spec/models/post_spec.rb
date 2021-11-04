require 'rails_helper'

# Checks if all errors come from given attribute , returns false if otherwise
def test_attribute_of_post(obj , attribute)
  # obj : object to check the attributes from
  # attribute: attribute name of the given object to check errors on
  obj.valid?
  error_count = obj.errors.count
  attribute_err_count = obj.errors[attribute].count
  if(attribute_err_count < error_count)
    return false
  else
    return true
  end
end

RSpec.describe Post, type: :model do
  let(:post) {FactoryBot.build :post}

  describe "is valid" do

    it "with title and description present" do
      expect(post).to be_valid
    end

  end

  describe "is not valid" do

    it "with title missing" do
      post.title = nil
      if(!test_attribute_of_post(post , :title))
        print "[ERROR]"
      end
      expect(post).to_not be_valid
    end

    it "with title shorter than 3 chars" do
      post.title = "x"
      if(!test_attribute_of_post(post , :title))
        print "[ERROR]"
      end
      expect(post).to_not be_valid
    end

    it "with title longer than 70 chars" do
      post.title = "x" * 71
      if(!test_attribute_of_post(post , :title))
        print "[ERROR]"
      end
      expect(post).to_not be_valid
    end

    it "with description missing" do
      post.description = nil
      if(!test_attribute_of_post(post , :description))
        print "[ERROR]"
      end
      expect(post).to_not be_valid
    end

  end

end

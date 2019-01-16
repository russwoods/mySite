require 'rails_helper'

describe Comment do
  context "create comment" do

    it "is not valid without a body" do
      expect(Comment.new(body: "")).not_to be_valid
    end

    it "is not valid without an user" do
      expect(Comment.new(user_id: nil)).to_not be_valid
    end

    it "is not valid without a rating" do
      expect(Comment.new(rating: nil)).not_to be_valid
    end

    it "is not valid without a product_id" do
      expect(Comment.new(product_id: nil)).to_not be_valid
    end
  end
end
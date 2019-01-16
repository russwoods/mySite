require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = FactoryBot.create(:product)
      @user = FactoryBot.create(:user)
    end

    before do
      @product.comments.create!(rating: 1, user_id: @user.id, body: "Nice!")
      @product.comments.create!(rating: 3, user_id: @user.id, body: "Ok!")
      @product.comments.create!(rating: 5, user_id: @user.id, body: "Great!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating). to eq 3.0
    end

    it "returns the lowest rating of all comments" do
      expect(@product.lowest_rating_comment). to be_valid
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Nice notepad")).not_to be_valid
    end

    it "returns the highest rating of all comments" do
      expect(@product.highest_rating_comment == 3.0). to be false
    end
  end
end
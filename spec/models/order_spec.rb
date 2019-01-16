require 'rails_helper'

describe Order do
  context "create order" do

    it "is not valid without product_id" do
      expect(Order.new(product_id: nil)).to_not be_valid
    end

    it "is not valid without user_id" do
      expect(Order.new(user_id: nil)).to_not be_valid
    end
  end
	
end
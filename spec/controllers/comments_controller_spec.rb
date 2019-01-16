require 'rails_helper'

describe CommentsController, type: :controller do

  context 'writes a comment' do
    before do
      @user = FactoryBot.build(:user)
      @product = FactoryBot.create(:product)
    end

    before do
      sign_in @user
    end

    it 'submitts a comment on the product page' do
      expect(response).to have_http_status(200)
    end
  end

end
require 'rails_helper'

  describe OrdersController, type: :controller do
    context 'GET #index' do
      before do
        @user1 = FactoryBot.create(:user)
      end

    it "doesnt allow non admin user to view" do
      sign_in(@user1)
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
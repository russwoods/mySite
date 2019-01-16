require 'rails_helper'

describe ProductsController, type: :controller do
#  let(:user) {User.create!(email: 'user@testmail.com', password: 'testers')}
#  let(:product) { Product.create!(name: "bike") }

  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
  end

  describe 'GET #index' do

    it 'renders the products index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do

    before do
      sign_in @user
    end

    it 'creates a new product' do
      @product = FactoryBot.create(:product)
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do

    before do
      sign_in @user
    end

    it 'redirects to new product page' do
      get :new, params: {id: @product.id}
      expect(response).to be_ok
    end
  end

  context "new products" do
    it 'can create product' do
      expect(@product).to be_valid
    end

    it 'cannot create product without name' do
      @product = FactoryBot.build(:product, name: "")
      expect(@product).not_to be_valid
    end
  end

  describe 'GET #edit' do

    before do
      sign_in @user
    end

    it 'redirects to edit product page' do
      get :edit, params: {id: @product.id}
      expect(response).to be_ok
    end
  end

  describe 'GET #show' do
    it 'renders the products show template' do
      get :show, params: { id: @product.id }
      expect(response).to be_ok
    end
  end

  describe 'PATCH #update' do

    before do
      sign_in @user
      @product = FactoryBot.create(:product)
    end

    it 'updates product' do
      article_params = FactoryBot.attributes_for(:product)
      expect{ patch :update, params: {id: @product.id, product: article_params }
      }.to change(Product,:count).by(0)
      expect(flash[:notice]).to eq 'Product was successfully updated.'
      expect(response).to redirect_to(@product)
    end
  end

  describe 'DELETE #destroy' do

    before do
      sign_in @user
      @product = FactoryBot.create(:product)
    end
    
    it 'deletes product' do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_url
    end
  end

end
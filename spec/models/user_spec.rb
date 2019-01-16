require 'rails_helper'

describe User do
  it 'should bo OK' do
    @user = FactoryBot.build(:user)
    expect(@user).to be_valid
  end
	
end
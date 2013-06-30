require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    let(:leo) { create(:user, password: 'secret', password_confirmation: 'secret') }
    it 'logs in a user' do
      post :create, name: leo.name, password: 'secret'
      response.should redirect_to admin_url
      expect(leo.id).to eq(session[:user_id])
    end

    it 'fails log in with bad password' do
      post :create, name: leo.name, password: 'wrong'
      response.should redirect_to login_url
    end
  end

  describe "GET 'destroy'" do
    it 'logs out the user' do
      delete :destroy
      response.should redirect_to store_url
    end
  end

end

require 'rails_helper'

describe UsersController, :type => :controller do
  
  describe "GET #index" do

    it "responds successfully with a http 200 status" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do

    before do
      @user = create(:user)
      sign_in @user
      get :index, id: @user.id
    end

    it "responds successfully with a http 200 status" do
      get :show, id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
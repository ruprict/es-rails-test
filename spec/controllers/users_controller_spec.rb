require 'rails_helper'

describe UsersController do
  fixtures :users
  before do
    @user = users(:one)
  end

  describe "index" do
    it "should get index" do
      get :index
      assert_response :success
      expect(assigns(:users)).to_not be_nil
    end
  end

  describe "create" do
    it "should create user" do
      expect do
        post :create, user: { auth_token: @user.auth_token, email: @user.email, password: @user.password }
      end.to change { User.count}.by(1) 

      assert_response 201
    end

  end

  describe "show" do
    it "should show user" do
      get :show, id: @user
      assert_response :success
    end

  end

  describe "update" do
    it "should update user" do
      put :update, id: @user, user: { auth_token: @user.auth_token, email: @user.email, password: @user.password }
      assert_response 204
    end

  end

  describe "destroy" do
    it "should destroy user" do
      expect { delete :destroy, id: @user }.to change { User.count }.by(-1)
      assert_response 204
    end
  end
end

require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "get users_path" do
    it "renders :index" do
      get users_path
      expect(response).to render_template(:index)
    end
  end
  describe "get user_path" do
    it "renders the :show template" do
      user = FactoryBot.create(:user)
      get user_path(id: user.id)
      expect(response).to render_template(:show)
    end
    it "redirects if user id is invalid" do
      get user_path(id: 10000)
      expect(response).to redirect_to users_path
    end
  end
  describe "get new_user_path" do
    it "renders the :new template" do
      get new_user_path
      expect(response).to render_template(:new)
    end
  end
  describe "get edit_user_path" do
    it "renders the :edit template" do
      user = FactoryBot.create(:user)
      get edit_user_path(id: user.id)
      expect(response).to render_template(:edit)
    end
  end
  describe "post users_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry"
  end
  describe "post users_path with invalid data" do
    it "does not save a new entry or redirect"
  end
  describe "put user_path with valid data" do
    it "updates an entry and redirects to the show path for the user"
  end
  describe "put user_path with invalid data" do
    it "does not update the user record or redirect"
  end
  describe "delete a user record" do
    it "deletes a user record"
  end
end

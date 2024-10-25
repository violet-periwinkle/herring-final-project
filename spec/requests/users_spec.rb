require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
  describe "get user_path" do
    it "renders the :show template"
    it "redirects if user id is invalid"
  end
  describe "get new_user_path" do
    it "renders the :new template"
  end
  describe "get edit_user_path" do
    it "renders the :edit template"
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

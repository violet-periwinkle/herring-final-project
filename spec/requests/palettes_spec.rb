require 'rails_helper'

RSpec.describe "Palettes", type: :request do
  describe "GET /palettes" do
    it "works! (now write some real specs)" do
      get palettes_path
      expect(response).to have_http_status(200)
    end
  end
  describe "get palette_path" do
    it "renders the :show template"
    it "redirects if palette id is invalid"
  end
  describe "get new_palette_path" do
    it "renders the :new template"
  end
  describe "get edit_palette_path" do
    it "renders the :edit template"
  end
  describe "post palettes_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry"
  end
  describe "post palettes_path with invalid data" do
    it "does not save a new entry or redirect"
  end
  describe "put palette_path with valid data" do
    it "updates an entry and redirects to the show path for the palette"
  end
  describe "put palette_path with invalid data" do
    it "does not update the palette record or redirect"
  end
  describe "delete a palette record" do
    it "deletes a palette record"
  end
end

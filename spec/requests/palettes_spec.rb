require 'rails_helper'

RSpec.describe "Palettes", type: :request do
  describe "GET /palettes" do
    it "works! (now write some real specs)" do
      get palettes_path
      expect(response).to render_template(:index)
    end
  end
  describe "get palette_path" do
    it "renders the :show template" do
      palette = FactoryBot.create(:palette)
      get palette_path(id: palette.id)
      expect(response).to render_template(:show)
    end
    it "redirects if palette id is invalid" do
      get palette_path(id: 10000)
      expect(response).to redirect_to palettes_path
    end
  end
  describe "get new_palette_path" do
    it "renders the :new template" do
      get new_palette_path
      expect(response).to render_template(:new)
    end
  end
  describe "get edit_palette_path" do
    it "renders the :edit template" do
      palette = FactoryBot.create(:palette)
      get edit_palette_path(id: palette.id)
      expect(response).to render_template(:edit)
    end
  end
  describe "post palettes_path with valid data" do
    it "saves a new entry and redirects to the edit path for the entry" do
      user = FactoryBot.create(:user)
      palette_attributes = FactoryBot.attributes_for(:palette, user_id: user.id)
      expect { post palettes_path, params: {palette: palette_attributes}}.to change(Palette, :count)
      expect(response).to redirect_to edit_palette_path(id: Palette.last.id)
    end
  end
  describe "post palettes_path with invalid data" do
    it "does not save a new entry or redirect" do
      palette_attributes = FactoryBot.attributes_for(:palette)
      expect { post palettes_path, params: {palette: palette_attributes}}.to_not change(Palette, :count)
      expect(response).to render_template(:new)
    end
  end
  describe "put palette_path with valid data" do
    it "updates an entry and redirects to the show path for the palette" do
      palette = FactoryBot.create(:palette)
      expect { put palette_path(id: palette.id), params: {palette: {title: "best_palette"}}
    }.to_not change(Palette, :count)
      expect(response).to redirect_to palette_path(id: palette.id)
    end
  end
  describe "put palette_path with invalid data" do
    it "does not update the palette record or redirect" do
      palette = FactoryBot.create(:palette)
      palette_attributes = FactoryBot.attributes_for(:palette)
      expect { put palette_path(id: palette.id), params: {palette: palette_attributes}
    }.to_not change(Palette, :count)
      expect(response).to redirect_to palette_path(id: palette.id)
    end
  end
  describe "delete a palette record" do
    it "deletes a palette record" do
      palette = FactoryBot.create(:palette)
      delete palette_path(id: palette.id)
      expect {palette.reload}.to raise_error(ActiveRecord::RecordNotFound)
      expect(response).to redirect_to palettes_path
    end
  end
end

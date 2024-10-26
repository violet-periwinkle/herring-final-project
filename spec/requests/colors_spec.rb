require 'rails_helper'

RSpec.describe "Colors", type: :request do
  describe "post palette_colors_path with valid data" do
    it "saves a new entry" do
      palette = FactoryBot.create(:palette)
      expect { post palette_colors_path(palette_id: palette.id) }.to change(palette.colors, :count)
    end
  end
  describe "post palette_colors_path with invalid data" do
    it "does not save a new entry" do
      palette = FactoryBot.create(:palette)
      expect { post palette_colors_path(palette_id: palette.id), params: {color: {proportion: nil}} }.to_not change(palette.colors, :count)
    end
  end
  describe "put palette_color_path with valid data" do
    it "updates an entry" do
      color = FactoryBot.create(:color)
      expect { put palette_color_path(palette_id: color[:palette_id], id: color[:id]), params: {color:{proportion: 8 }} }.to_not change(color.palette.colors, :count)
      color.reload
      expect(color[:proportion]).to eq(8)
    end
  end
  describe "put palette_color_path with invalid data" do
    it "does not update the color record" do
      color = FactoryBot.create(:color)
      expect { put palette_color_path(palette_id: color[:palette_id], id: color[:id]), params: {color:{ hex_code: 'ultraviolet' }} }.to_not change(color.palette.colors, :count)
      color.reload
      expect(color[:hex_code]).to_not eq("ultraviolet")
    end
  end
  describe "delete a color record" do
    it "deletes a color record" do
      color = FactoryBot.create(:color)
      delete palette_color_path(id: color[:id], palette_id: color[:palette_id])
      expect {color.reload}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end


require 'rails_helper'

RSpec.describe "Palettes", type: :request do
  describe "GET /palettes" do
    it "works! (now write some real specs)" do
      get palettes_index_path
      expect(response).to have_http_status(200)
    end
  end
end

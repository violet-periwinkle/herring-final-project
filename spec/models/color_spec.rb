require 'rails_helper'

RSpec.describe Color, type: :model do
  subject = Color.new({hex_code: '#808080', proportion: 1, palette: Palette.new(title: "title", background: "#f0f0f0", layout: "rows", user: User.new(name: "user", password: "password")) })
  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end
  it "is not valid without hex code"
  it "is not valid without valid color"
  it "is not valid without proportion"
  it "is not valid without palette"
end

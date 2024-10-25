require 'rails_helper'

RSpec.describe Palette, type: :model do
  subject = Palette.new(title: "title", background: "#f0f0f0", layout: "rows", spacing: 1, user: User.new(name: "user", password: "password"))
  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end
  it "is not valid without title"
  it "is not valid without user"
  it "is not valid without layout"
  it "is not valid without spacing"
  it "is not valid without background"
  it "is not valid if background color is invalid" do
    subject.background = "ultraviolet"
    expect(subject).to_not be_valid
  end
end

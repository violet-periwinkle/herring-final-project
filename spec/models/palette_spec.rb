require 'rails_helper'

RSpec.describe Palette, type: :model do
  subject = FactoryBot.build(:palette)
  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end
  it "is not valid without title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without layout" do
    subject.layout = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without spacing" do
    subject.spacing = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without background" do
    subject.background = nil
    expect(subject).to_not be_valid
  end
  it "is not valid if background color is invalid" do
    subject.background = "ultraviolet"
    expect(subject).to_not be_valid
  end
end

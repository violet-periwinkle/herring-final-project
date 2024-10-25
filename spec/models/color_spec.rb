require 'rails_helper'

RSpec.describe Color, type: :model do
  subject = FactoryBot.build(:color)
  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end
  it "is not valid without hex code" do
    subject.hex_code = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without valid color" do
    subject.hex_code = "infrared"
    expect(subject).to_not be_valid
  end
  it "is not valid without proportion" do
    subject.proportion = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without palette" do
    subject.palette = nil
    expect(subject).to_not be_valid
  end
end

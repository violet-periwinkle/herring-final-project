require 'rails_helper'

RSpec.describe User, type: :model do
  subject = FactoryBot.build(:user)
  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end
  it "is not valid without username" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without password" do
    subject.password=nil
    expect(subject).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:item)).to be_valid
  end

  it "is invalid without a name" do
    item = FactoryGirl.build(:item, name: nil)
    expect(item).not_to be_valid
  end
end
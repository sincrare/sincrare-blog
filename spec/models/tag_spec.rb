require 'rails_helper'

RSpec.describe Tag, type: :model do
  it '正常登録' do
    tag = FactoryGirl.build(:tag)
    expect(tag).to be_valid
  end

  it 'nameが必須であること' do
    tag = FactoryGirl.build(:tag_invalid_name)
    expect(tag).not_to be_valid
  end
end

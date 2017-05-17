require 'rails_helper'

RSpec.describe Authority, type: :model do
  it '正常登録' do
    authority = FactoryGirl.build(:authority)
    expect(authority).to be_valid
  end

  it 'nameが必須であること' do
    authority = FactoryGirl.build(:authority_invalid_name)
    expect(authority).not_to be_valid
  end
end

require 'rails_helper'

RSpec.describe AccessHistory, type: :model do
  it '正常登録' do
    access_history = FactoryGirl.build(:access_history)
    expect(access_history).to be_valid
  end

  it 'user_idが必須であること' do
    access_history = FactoryGirl.build(:access_history_invalid_user_id)
    expect(access_history).not_to be_valid
  end
end

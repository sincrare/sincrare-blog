require 'rails_helper'

RSpec.describe Like, type: :model do
  it '正常登録' do
    like = FactoryGirl.build(:like)
    expect(like).to be_valid
  end

  it 'article_idが必須であること' do
    like = FactoryGirl.build(:like_invalid_article_id)
    expect(like).not_to be_valid
  end

  it 'user_idが必須であること' do
    like = FactoryGirl.build(:like_invalid_user_id)
    expect(like).not_to be_valid
  end
end

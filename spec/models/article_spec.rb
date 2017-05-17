require 'rails_helper'

RSpec.describe Article, type: :model do
  it '正常登録' do
    article = FactoryGirl.build(:article)
    expect(article).to be_valid
  end

  it 'titleが必須であること' do
    article = FactoryGirl.build(:article_invalid_title)
    expect(article).not_to be_valid
  end

  it 'entry_atが必須であること' do
    article = FactoryGirl.build(:article_invalid_entry_at)
    expect(article).not_to be_valid
  end
end

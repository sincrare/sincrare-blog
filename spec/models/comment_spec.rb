require 'rails_helper'

RSpec.describe Comment, type: :model do
  it '正常登録' do
    comment = FactoryGirl.build(:comment)
    expect(comment).to be_valid
  end

  it 'article_idが必須であること' do
    comment = FactoryGirl.build(:comment_invalid_article_id)
    expect(comment).not_to be_valid
  end

  it 'entry_user_idが必須であること' do
    comment = FactoryGirl.build(:comment_invalid_entry_user_id)
    expect(comment).not_to be_valid
  end
end

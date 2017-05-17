FactoryGirl.define do
  factory :comment do
    content 'コメント'
    entry_user_name 'テストユーザー'
    entry_user_id 1
    created_at DateTime.now
    updated_at DateTime.now
    association :article, factory: :article
    association :user, factory: :user
  end

  factory :comment_invalid_article_id, parent: :comment do |m|
    m.article_id nil
  end

  factory :comment_invalid_entry_user_id, parent: :comment do |m|
    m.article_id nil
  end
end

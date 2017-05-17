FactoryGirl.define do
  factory :like do
    created_at DateTime.now
    updated_at DateTime.now
    association :article, factory: :article
    association :user, factory: :user
  end

  factory :like_invalid_article_id, parent: :like do |m|
    m.article_id nil
  end

  factory :like_invalid_user_id, parent: :like do |m|
    m.user_id nil
  end
end

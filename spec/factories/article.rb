FactoryGirl.define do
  factory :article do
    title '初めての記事'
    content 'テスト'
    entry_at DateTime.now
    is_draft false
    og_image 'image.png'
    created_at DateTime.now
    updated_at DateTime.now
  end

  factory :article_invalid_title, parent: :article do |m|
    m.title nil
  end

  factory :article_invalid_entry_at, parent: :article do |m|
    m.entry_at nil
  end
end
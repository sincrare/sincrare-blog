FactoryGirl.define do
  factory :tag do
    name 'サイト紹介'
    created_at DateTime.now
    updated_at DateTime.now
  end

  factory :tag_invalid_name, parent: :tag do |m|
    m.name nil
  end
end

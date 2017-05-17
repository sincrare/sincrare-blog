FactoryGirl.define do
  factory :authority do
    name '未ログイン'
    created_at DateTime.now
    updated_at DateTime.now
  end

  factory :authority_invalid_name, parent: :authority do |m|
    m.name nil
  end
end

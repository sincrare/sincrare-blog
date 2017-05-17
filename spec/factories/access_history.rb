FactoryGirl.define do
  factory :access_history do
    ip_address '127.0.0.1'
    host_name 'sincrare.com'
    link_source 'link_source'
    browser 'chrome'
    created_at DateTime.now
    updated_at DateTime.now
    association :user, factory: :user
  end

  factory :access_history_invalid_user_id, parent: :access_history do |m|
    m.user_id nil
  end
end
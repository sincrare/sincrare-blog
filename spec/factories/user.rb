FactoryGirl.define do
  factory :user do
    name 'test'
    email 'test@user.com'
    password 'password'
    password_confirmation 'password'
    association :authority, factory: :authority
    confirmed_at Time.now
  end
end
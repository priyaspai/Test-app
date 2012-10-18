FactoryGirl.define do
  factory :user do
    email                 "test@tcs.com"
    password               "secret"
    password_confirmation  "secret"
  end
end

FactoryGirl.define do
  factory :user do
    email                 "test@.com"
    password               "secret"
    password_confirmation  "secret"
  end
end

FactoryGirl.define do
  factory :user do
    name 'Jeff'
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password 'pw'
  end
end

# We are creating a new user and this
# is automatically included in RSpec
FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@myjo.com" }
    password "foobar"
    password_confirmation "foobar"
  end

    factory :micropost do
      content "Lorem ipsim"
      user
    end
  end

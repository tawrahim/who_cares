# We are creating a new user and this
# is automatically included in RSpec
FactoryGirl.define do
  factory :user do
    name "Tawheed Raheem"
    email "tawrahim@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end

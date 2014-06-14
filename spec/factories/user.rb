FactoryGirl.define do
  factory :user do
    screen_name { Faker::Name.first_name }
  end
end

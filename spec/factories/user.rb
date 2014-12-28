FactoryGirl.define do
  factory :user do
    screen_name { Faker::Name.first_name }

    after(:build) do |user|
      if user.external_accounts.empty?
        user.external_accounts << build(:external_account, user: user)
      end
    end
  end
end

FactoryGirl.define do
  factory :comment do
    # attributes
    body { Faker::Lorem.sentence(3, true, 4) }
    # associations
    user
    event
  end
end
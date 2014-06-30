FactoryGirl.define do
  factory :event do
    # attributes
    sequence(:title) { |n| "Event-#{n}" }
    description { Faker::Lorem.sentence }
    address { Faker::Address.street_address }
    postcode { "EC1R 5DF" }
    date { "11/07/2014" }

    # associations
    user
    # factory :event_with_invitations do
    #   ignore do
    #     invitation_count 5 # tell FG that this IS NOT an attribute
    #   end
    #   after(:create) do |event, evaluator|
    #     FactoryGirl.create_list :invitation, evaluator.invitation_count, event: event
    #   end
    # end
  end
end
FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" } #sequence
    username { "#{name}" }
    email { "#{name}@gmail.com" }       #dependent attribute
    password "password"
    role "user"
    # associations
  end
end
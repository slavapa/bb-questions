FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:family_name)  { |n| "Family_name_#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "xxxxxx"
    password_confirmation "xxxxxx"
    admin true

    factory :admin do
      name "admin"
      email "admin@gmail.com"
      password "xxxxxx"
      password_confirmation "xxxxxx"
      admin true
    end
  end

end

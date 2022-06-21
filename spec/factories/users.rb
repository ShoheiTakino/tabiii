FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 4) + 'a' + '1' }
    password_confirmation { password }
    last_name             { person }
    first_name            { person }
    profile               { Faker::Lorem.characters(number:200) }
  end
end
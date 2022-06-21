FactoryBot.define do
  factory :post do
    association :user
    
    title                {  Faker::Lorem.characters(number:20) }
    content              {  Faker::Lorem.characters(number:400) }
    province_id          { 2 }
    address              { '大阪府大阪市北区' }

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

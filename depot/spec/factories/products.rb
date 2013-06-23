FactoryGirl.define do
  factory :product do
    title { Faker::Name.name }
    description 'Description'
    price 9.99
    image_url 'freddie.jpg'
  end
end
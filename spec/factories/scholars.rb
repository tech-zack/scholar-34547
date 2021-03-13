FactoryBot.define do
  factory :scholar do
   title              {'test'}
   text               {'test'}
   category_id           {2}
   association :user
   
   after(:build) do |scholar|
    scholar.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
   end
  end
end
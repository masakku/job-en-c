FactoryBot.define do
  factory :matter do
    title                        { 'program' }
    info                         { 'ruby' }
    genre_id                     { '2' }
    scheduled_id                 { '3' }
    detail                       { 'HTML,CSS' }
    price                        { '11111' }
    association :user

    after(:build) do |matter|
      matter.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end

    factory :matter_no_image, class: Matter do
      title                        { 'program' }
      info                         { 'ruby' }
      genre_id                     { '2' }
      scheduled_id                 { '3' }
      detail                       { 'HTML,CSS' }
      price                        { '11111' }
    end
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :product, class: Product do
    name { "Product #{rand(2000)}" }
    status :for_sale
    price { Faker::Commerce.price(range = 10..10000.0, as_string = false) }
    trait :with_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join("spec", "fixtures", "files", "test.jpg"), "image/jpeg") }
    end
    association :seller, factory: :seller
    association :category, factory: :category
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :category, class: Category do
    name { "Product #{rand(2000)}" }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :category, class: Category do
    name { "Category #{rand(20)}" }
  end
end

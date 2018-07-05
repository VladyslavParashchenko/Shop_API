# frozen_string_literal: true

unless Rails.env.production?
  require "rspec/core/rake_task"
  namespace :ci do
    desc "Run all tests and generate a merged coverage report"
    task tests: [:spec]
  end
end

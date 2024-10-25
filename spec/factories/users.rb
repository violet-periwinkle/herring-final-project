require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    password { Faker::Internet.password }
  end
end
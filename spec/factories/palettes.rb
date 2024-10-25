require 'faker'

FactoryBot.define do
  factory :palette do
    title { "#{Faker::Adjective.positive} Palette" }
    user 
    background { Faker::Color.hex_color }
    layout { ["rows", "columns"].sample }
    spacing { rand(6) }
  end
end

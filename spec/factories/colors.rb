FactoryBot.define do
  factory :color do
    hex_code { Faker::Color.hex_color }
    palette
    proportion { rand(4) }
  end
end

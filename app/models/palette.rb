class Palette < ApplicationRecord
  belongs_to :user
  has_many :colors
  accepts_nested_attributes_for :colors
end

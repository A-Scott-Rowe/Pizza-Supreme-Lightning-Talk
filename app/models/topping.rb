class Topping < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :extra_cost, presence: true
end

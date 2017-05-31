class Topping < ApplicationRecord
  include RoleModel

  after_validation :set_role

  validates :name, presence: true, uniqueness: true
  validates :extra_cost, presence: true

  roles_attribute :roles_mask
  roles :premium, :vip

  private

  def set_role
    roles << :premium if extra_cost != 0 || extra_cost.nil?
  end
end

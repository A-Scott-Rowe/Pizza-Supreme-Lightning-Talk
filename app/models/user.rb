class User < ApplicationRecord
  include RoleModel
  roles_attribute :roles_mask
  roles :admin

  validates :email, presence: true, uniqueness: true

end

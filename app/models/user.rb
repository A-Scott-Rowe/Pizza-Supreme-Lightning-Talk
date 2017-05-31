class User < ApplicationRecord
  include RoleModel
  roles_attribute :roles_mask
  roles :admin, :vip , :bad_tipper

  validates :email, presence: true, uniqueness: true

end

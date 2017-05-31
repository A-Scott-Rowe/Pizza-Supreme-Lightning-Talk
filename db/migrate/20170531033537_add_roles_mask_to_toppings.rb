class AddRolesMaskToToppings < ActiveRecord::Migration[5.1]
  def change
    add_column :toppings, :roles_mask, :int
  end
end

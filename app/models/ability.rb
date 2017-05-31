class Ability
  include CanCan::Ability

  attr_accessor :user

  def initialize(user)
    @user = user

    apply_abilities
  end

  private

  def apply_abilities
    if  @user.has_any_role? :vip, :admin
      can :read, Topping
    elsif @user.is? :bad_tipper
      can :read, Topping, roles_mask: [0,nil]
    else # normal user
      can :read, Topping, roles_mask: [0,nil,1]
    end
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      cannot :manage, :all
    elsif  user.has_role? :admin
      can :manage, :all
    else
      cannot :manage, :all
    end
  end
end

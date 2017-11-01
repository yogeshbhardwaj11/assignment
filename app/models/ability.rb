class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    unless user.role.blank?
      if user.role.name == "admin"
        can [:index, :show, :new, :edit, :create, :update, :destroy], [SecretCode]
      end
    end
  end
end

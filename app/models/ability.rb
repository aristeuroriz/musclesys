class Ability
  include CanCan::Ability

  user ||= User.new

  alias_action :create, :read, :update, :destroy, :to => :crud

  alias_action :create, :read, :update, :to => :prof

    def initialize(user)

        if user.admin?
          can :manage, :all
        end

    end

end

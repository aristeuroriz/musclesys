class Ability

 include CanCan::Ability
     def initialize(user)
                        # allow everyone to read everything
        if user && user.admin?
          can :access, :rails_admin       # only allow admin users to access Rails Admin
          can :dashboard                  # allow access to dashboard
          if user.role == "admin"
            can :manage, :all             # allow superadmins to do anything

        end
      end
    end

  end


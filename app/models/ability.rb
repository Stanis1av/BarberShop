# frozen_string_literal: true

class Ability
  include CanCan::Ability

    def initialize(user, controller_namespace)
      user ||= User.new # guest user (not logged in)

      alias_action :create, :read, :update, :destroy, to: :crud

      case controller_namespace
        when 'Admin'
          if user.super_admin?
            can :manage, :all
          elsif user.admin?

            cannot :manage, Role
            can [:read, :update, :destroy], User, role: {var_name: 'salon_manager'}, area: user.area
            can :create, User
            can :manage, :dashboard

          elsif user.salon_manager?
            can :manage, :dashboard
            can :read, :all # [User, Role, Contact, Location]
          end
        else
          # rules for non-admin controllers here
          if user.super_admin?
            can :manage, :all
          elsif user.admin?
            can :manage, :all
          elsif user.salon_manager?
            can :manage, :all
          elsif user.regular?
            can :manage, :all
          end
      end
    end

end

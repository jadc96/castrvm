class FavoritePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end

    def create?
      true
    end

    def update?
      true
    end

    def destroy?
      true
    end
  end
end

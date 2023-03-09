class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # model.all, mesma coisa. Apresenta todas as intâncias

      # Retorna todos os restaurantes para o policy_scope do index
      # scope.all
      # Retorna apenas os restaurantes do current_user para o policy_scope do index
      scope.where(user: user)
    end
  end

  def show?
    true
  end

  # new retorna de create, não é possível ver o form uma vez que não se pode dar submit
  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end

class SchedulesPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope

    def resolve
      scope.all
    end
  end
end

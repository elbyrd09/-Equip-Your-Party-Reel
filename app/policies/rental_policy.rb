class RentalPolicy < ApplicationPolicy
  def show?
    record.user == user || record.item.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user || record.item.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

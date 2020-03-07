class ReviewPolicy < ApplicationPolicy

   def create?
    record.rental.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

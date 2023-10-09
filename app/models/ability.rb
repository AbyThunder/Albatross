class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, User
    elsif user.manager?
      can :manage, :all
      cannot :manage, User, role: :admin # Managers can't manage admins
    elsif user.trainer?
      can :read, Lesson, trainers: { id: user.id }
      can :update, Lesson, trainers: { id: user.id }
    elsif user.candidate?
      can :read, Candidate, user_id: user.id
      can :read, Lesson, candidates: { user_id: user.id }
      can :read, Academy
      can :create, AcademyRequest
    elsif user.player?
      can :read, Player, user_id: user.id
    end
  end
end

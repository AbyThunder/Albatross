class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.role.admin?
      can :manage, User
    elsif user.role.manager?
      can :manage, :all
      cannot :manage, User, role: :admin # Managers can't manage admins
    elsif user.role.trainer?
      can :read, Lesson, trainers: { id: user.id }
      can :update, Lesson, trainers: { id: user.id }
      can :read, Academy
    elsif user.role.candidate?
      can :read, Candidate, user_id: user.id
      can :read, Lesson, candidates: { user_id: user.id }
      can :read, Academy
      can :create, AcademyRequest
    elsif user.role.player?
      can :read, Player, user_id: user.id
      can :read, League
      can :read, Tournament
      can :create, TournamentRegistration, user_id: user.id
      can :read, TournamentRegistration, user_id: user.id
    end
  end
end

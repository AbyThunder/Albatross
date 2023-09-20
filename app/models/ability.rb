# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.manager?
      # Manager can perform all actions on all models
      can :manage, :all
    elsif user.trainer?
      # Trainer can read and update lessons they are associated with
      can :read, Lesson, trainers: { id: user.id }
      can :update, Lesson, trainers: { id: user.id }
    elsif user.candidate?
      # Candidate can read their own candidates and lessons
      can :read, Candidate, user_id: user.id
      can :read, Lesson, candidates: { user_id: user.id }
      can :read, Academy
      can :create, AcademyRequest
    elsif user.player? # TBD
      # Player can read their own player information and associated lessons
      can :read, Player, user_id: user.id
    end
  end
end

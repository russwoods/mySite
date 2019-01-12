class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      user = User.new
    elsif user.admin?
      can :manage, :all
    else
      can :manage, User, id: user.id

      can :manage, Comment.where(user_id: user.id) do |comment|
        comment.user_id == user.id
      end

      cannot [:destroy, :delete], Comment.where(user_id: user.id) do |comment|
        comment.user_id == user.id
      end

    end
  end
end
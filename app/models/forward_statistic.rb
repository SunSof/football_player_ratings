class ForwardStatistic < Statistic
  validates :goals, :assists, :shots_on_target, :successful_dribbles, presence: true
  @@point_system = {goals: 4, assists: 3, shots_on_target: 2, successful_dribbles: 1}

  def points
    (goals * @@point_system[:goals]) +
      (assists * @@point_system[:assists]) +
      (shots_on_target * @@point_system[:shots_on_target]) +
      (successful_dribbles * @@point_system[:successful_dribbles])
  end
end

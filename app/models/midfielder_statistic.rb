class MidfielderStatistic < Statistic
  validates :tackles, :goals, :fouls_won, presence: true
  @@point_system = {tackles: 3, goals: 2, fouls_won: 1}

  def points
    (tackles * @@point_system[:tackles]) +
      (goals * @@point_system[:goals]) +
      (fouls_won * @@point_system[:fouls_won])
  end
end

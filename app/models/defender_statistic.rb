class DefenderStatistic < Statistic
  validates :tackles, :clearances, :interceptions, :block_crosses, presence: true
  @@point_system = {tackles: 4, clearances: 3, interceptions: 2, block_crosses: 1}

  def points
    (tackles * @@point_system[:tackles]) +
      (clearances * @@point_system[:clearances]) +
      (interceptions * @@point_system[:interceptions]) +
      (block_crosses * @@point_system[:block_crosses])
  end
end

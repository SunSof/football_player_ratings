class GoalkeeperStatistic < Statistic
  validates :saves, :clearances, :shot_blocks, presence: true
  @@point_system = {saves: 3, clearances: 2, shot_blocks: 1}

  def points
    (saves * @@point_system[:saves]) +
      (clearances * @@point_system[:clearances]) +
      (shot_blocks * @@point_system[:shot_blocks])
  end
end

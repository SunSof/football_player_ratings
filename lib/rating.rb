class Rating
  def self.calculate(player_id)
    statistics = Statistic.where(player_id: player_id)
    p statistics
    statistics.reduce(0) do |memo, stat|
      memo += stat.points
      memo
    end
  end
end

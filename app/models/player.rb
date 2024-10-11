class Player < ApplicationRecord
  has_many :statistics
  enum role: { Goalkeeper: 0, Defender: 1, Midfielder: 2, Forward: 3 }

  validates :role, presence: true

  def rating
    statistics.reduce(0) do |memo, stat|
      memo += stat.points
      memo
    end
  end
end

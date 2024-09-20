class Player < ApplicationRecord
  has_many :statistics
  enum role: {Goalkeeper: 0, Defender: 1, Midfielder: 2, Forward: 3}

  validates :role, presence: true
end

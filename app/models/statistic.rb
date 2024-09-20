class Statistic < ApplicationRecord
  belongs_to :player
  validates :type, presence: true
  before_validation :role_to_type

  private

  def role_to_type
    self.type = player.role + "Statistic"
  end
end

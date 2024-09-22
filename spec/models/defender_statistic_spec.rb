require "rails_helper"

RSpec.describe DefenderStatistic, type: :model do
  context "instance methods" do
    describe "#points" do
      it "calculates points" do
        statistic = DefenderStatistic.new(tackles: 4, clearances: 3, interceptions: 2, block_crosses: 1)
        expect(statistic.points).to eq(4 * 4 + 3 * 3 + 2 * 2 + 1 * 1)
      end
    end
  end
end

require "rails_helper"

RSpec.describe MidfielderStatistic, type: :model do
  context "instance methods" do
    describe "#points" do
      it "calculates points" do
        statistic = MidfielderStatistic.new(tackles: 5, goals: 2, fouls_won: 3)
        expect(statistic.points).to eq(5 * 3 + 2 * 2 + 3 * 1)
      end
    end
  end
end

require "rails_helper"

RSpec.describe ForwardStatistic, type: :model do
  context "instance methods" do
    describe "#points" do
      it "calculates points" do
        statistic = ForwardStatistic.new(goals: 4, assists: 3, shots_on_target: 2, successful_dribbles: 1)
        expect(statistic.points).to eq(4 * 4 + 3 * 3 + 2 * 2 + 1 * 1)
      end
    end
  end
end

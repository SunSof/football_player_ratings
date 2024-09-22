require "rails_helper"

RSpec.describe GoalkeeperStatistic, type: :model do
  context "instance methods" do
    describe "#points" do
      it "calculates points" do
        statistic = GoalkeeperStatistic.new(saves: 3, clearances: 2, shot_blocks: 1)
        expect(statistic.points).to eq(3 * 3 + 2 * 2 + 1 * 1)
      end
    end
  end
end

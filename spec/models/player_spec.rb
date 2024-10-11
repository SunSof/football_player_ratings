RSpec.describe Player, type: :model do
  context "instance methods" do
    describe "#rating" do
      it "calculates rating" do
        player = FactoryBot.create(:player, id: 1234)
        statistics = FactoryBot.create(:statistic, id: 123, player_id: 1234)
        expect(player.rating).to eq 14
      end
    end
  end
end

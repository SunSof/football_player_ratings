require "rails_helper"

RSpec.describe Rating, type: :class do
  context "class methods" do
    describe "::calculate" do
      it "when player has statistics" do
        player = FactoryBot.create(:player, id: 12)
        FactoryBot.create(:statistic, player_id: player.id, saves: 3, clearances: 2, shot_blocks: 1)

        expect(Rating.calculate(player.id)).to eq 14
      end

      it "returns 0 when player hasnt statistics" do
        player = FactoryBot.create(:player, id: 12)
        expect(Rating.calculate(player.id)).to eq 0
      end
    end
  end
end

require "rails_helper"

describe StatisticsApi do
  describe "GET /players" do
    it "returns 5 players on first page and 5 on second page" do
      10.times do
        FactoryBot.create(:player)
      end
      get "/api/players", params: {page: 1}

      json_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json_response.size).to eq(5)
      expect(json_response.first["id"]).to eq(1)
      expect(json_response.last["id"]).to eq(5)

      get "/api/players", params: {page: 2}

      json_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json_response.size).to eq(5)
      expect(json_response.first["id"]).to eq(6)
      expect(json_response.last["id"]).to eq(10)
    end
  end

  describe "GET /players/:player_id/rating" do
    context "when player data exists" do
      it "returns the current players rating" do
        player = FactoryBot.create(:player, id: 123456789)
        allow(Rating).to receive(:calculate).with(player.id).and_return(100)

        get "/api/players/#{player.id}/rating", params: {player_id: 123456789}

        expect(response.status).to eq 200
        expect(JSON.parse(response.body)).to eq 100
      end

      it "returns 404 if player not found" do
        player_id = 999

        get "/api/players/#{player_id}/rating", params: {player_id: 999}

        expect(response.status).to eq 404
      end
    end
  end

  describe "POST /players/player_id/statistics/create" do
    it "creates statistics" do
      valid_params = {player_id: 1, goals: 2, assists: 1, shots_on_target: 5}
      player = FactoryBot.create(:player, id: 1)
      Statistic.create(valid_params)

      post "/api/players/#{player.id}/statistics/create", params: valid_params
      json_response = JSON.parse(response.body)
      expect(response.status).to eq(201)
      expect(json_response).to include(valid_params.transform_keys(&:to_s))
      expect(Statistic.find(1).goals).to eq(2)
    end
  end
end

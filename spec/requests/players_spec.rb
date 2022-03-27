require "rails_helper"

RSpec.describe "v1/players" do
  let!(:player) { create(:player) }

  describe "GET /" do
    it "returns the players data" do
      get "/v1/players"

      expect(response).to be_successful
    end
  end

  describe "GET /:id" do
    it "returns the player data" do
      get "/v1/players/#{player.id}"

      expect(response).to be_successful
    end
  end

  describe "POST /" do
    let(:valid_params) {
      { name: "Ultimate player" }
    }

    it "creates a new player" do
      expect {
        post "/v1/players", params: valid_params
      }.to change { Player.count }.by(1)

      expect(response).to be_successful
    end
  end
end

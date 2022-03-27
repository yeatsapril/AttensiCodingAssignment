require "rails_helper"

RSpec.describe "v1/playthroughs" do
  let!(:player) { create(:player) }
  let!(:playthrough) { create(:playthrough) }

  describe "GET /" do

    before do
      allow(TimeSpentService).to receive(:format_time_spent).with(playthrough.time_spent).and_return(playthrough.time_spent)
    end

    it "returns the playthroughs data" do
      get "/v1/playthroughs"

      expect(response).to be_successful
    end
  end

  describe "GET /:id" do

    before do
      allow(TimeSpentService).to receive(:format_time_spent).with(playthrough.time_spent).and_return(playthrough.time_spent)
    end

    it "returns the playthrough data" do
      get "/v1/playthroughs/#{playthrough.id}"

      expect(response).to be_successful
    end
  end

  describe "POST /" do
    let(:valid_params) {
      {
        started_playing: DateTime.now - 2.hours,
        finished_playing: DateTime.now,
        score: 55,
        player_id: player.id
       }
    }

    it "creates a new playthrough" do
      expect {
        post "/v1/playthroughs", params: valid_params
      }.to change { Playthrough.count }.by(1)

      expect(response).to be_successful
    end
  end
end

require "rails_helper"

RSpec.describe "v1/weekly_summaries" do
  let!(:playthrough) { create(:playthrough) }
  let!(:playthrough_2) {
    create(:playthrough,
    started_playing: DateTime.new(2022, 03, 01),
    finished_playing: DateTime.new(2022, 03, 01))
  }
  let!(:playthrough_3) {
    create(:playthrough,
      score: playthrough.score - 1,
      time_spent: 3700.00)
  }

  describe "GET /:score" do
    it "returns the weekly_summary: score data" do
      get "/v1/weekly_summaries/score"

      expect(response).to be_successful
      expect(response.body).to eq([{
        player: playthrough.player.name,
        score: playthrough.score,
        time_spent: "01:00:00",
      },
      {
        player: playthrough_3.player.name,
        score: playthrough_3.score,
        time_spent: "01:01:40",
      }].to_json)
    end
  end

    describe "GET /:time_played" do
    it "returns the weekly_summary: time_played data" do
      get "/v1/weekly_summaries/time_played"

      expect(response).to be_successful
      expect(response.body).to eq([{
        player: playthrough_3.player.name,
        score: playthrough_3.score,
        time_spent: "01:01:40",
      },
      {
        player: playthrough.player.name,
        score: playthrough.score,
        time_spent: "01:00:00",
      }].to_json)
    end
  end
end

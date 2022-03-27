require "rails_helper"

RSpec.describe "v1/impact_reports" do
  let!(:playthrough) { create(:playthrough) }
  let!(:playthrough_2) { create(:playthrough, score: playthrough.score - 1) }

  describe "GET /" do
    it "returns the impact_report data" do
      get "/v1/impact_reports"

      expect(response).to be_successful
      expect(response.body).to eq([{
        name: playthrough.player.name,
        first_score: playthrough.score,
        highest_score: playthrough.score,
        number_of_playthroughs: 1,
        total_time_spent: "01:00:00"
      },
      {
        name: playthrough_2.player.name,
        first_score: playthrough_2.score,
        highest_score: playthrough_2.score,
        number_of_playthroughs: 1,
        total_time_spent: "01:00:00"
      }
    ].to_json)
    end
  end
end

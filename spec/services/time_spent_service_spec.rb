require "rails_helper"

RSpec.describe TimeSpentService do
  subject { described_class }

  describe "#calculate_time_spent!" do
    it "calculates the time spent" do
      time_spent = subject.calculate_time_spent!(
        DateTime.now.utc,
        DateTime.now.utc - 1.hour
        )

      expect(time_spent.round(2)).to eql(3600.00)
    end
  end

  describe "#format_time_spent" do
    it "formats time_spent in to H:M:S" do
      formatted_time = subject.format_time_spent(3600.00)

      expect(formatted_time).to eql("01:00:00")
    end
  end
end

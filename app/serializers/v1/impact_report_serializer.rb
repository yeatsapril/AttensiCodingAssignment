module V1
  class ImpactReportSerializer < ActiveModel::Serializer
    attributes :name, :first_score, :highest_score, :number_of_playthroughs, :total_time_spent

    def first_score
      object.playthroughs.first.score
    end

    def highest_score
      object.playthroughs.order(score: :desc).first.score
    end

    def number_of_playthroughs
      object.playthroughs.count
    end

    def total_time_spent
      total_seconds = object.playthroughs.map do |time|
        time.finished_playing - time.started_playing
      end.inject(0, &:+)

      Time.at(total_seconds).utc.strftime("%H:%M:%S")
    end
  end
end

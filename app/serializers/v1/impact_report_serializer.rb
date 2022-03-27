module V1
  class ImpactReportSerializer < ActiveModel::Serializer
    attributes :player, :first_score, :highest_score, :number_of_playthroughs, :total_time_spent

    def player
      object.name
    end

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
      total_seconds = object.playthroughs.map(&:time_spent).inject(0, &:+)

      TimeSpentService.format_time_spent(total_seconds)
    end
  end
end

module V1
  class WeeklySummarySerializer < ActiveModel::Serializer
    attributes :player, :score, :time_spent

    def player
      object.player.name
    end

    def time_spent
      TimeSpentService.format_time_spent(object.time_spent)
    end
  end
end

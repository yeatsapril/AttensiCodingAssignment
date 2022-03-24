module V1
  class WeeklySummarySerializer < ActiveModel::Serializer
    attributes :player, :score, :time_spent

    def player
      object.player.name
    end

    def time_spent
      Time.at(object.finished_playing - object.started_playing).utc.strftime("%H:%M:%S")
    end
  end
end

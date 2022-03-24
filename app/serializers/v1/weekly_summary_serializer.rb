module V1
  class WeeklySummarySerializer < ActiveModel::Serializer
    attributes :player, :score, :time_spent

    def player
      object.player.name
    end
  end
end

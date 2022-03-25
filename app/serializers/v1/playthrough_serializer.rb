module V1
  class PlaythroughSerializer < ActiveModel::Serializer
    attributes :id, :score, :started_playing, :time_spent


    def time_spent
      TimeSpentService.format_time_spent(object.time_spent)
    end
  end
end

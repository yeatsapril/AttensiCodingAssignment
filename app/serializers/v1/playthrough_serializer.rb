module V1
  class PlaythroughSerializer < ActiveModel::Serializer
    attributes :id, :score, :started_playing, :time_spent

    def time_spent
      Time.at(object.finished_playing - object.started_playing).utc.strftime("%H:%M:%S")
    end
  end
end

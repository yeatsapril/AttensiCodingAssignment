module V1
  class PlaythroughSerializer < ActiveModel::Serializer
    attributes :id, :score, :started_playing, :time_spent
  end
end

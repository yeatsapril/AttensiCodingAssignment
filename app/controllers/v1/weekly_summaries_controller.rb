module V1
  class WeeklySummariesController < ApplicationController

    def score
      @playthroughs = Playthrough.all.order(score: :desc).limit(10)
      render json: @playthroughs, each_serializer: V1::WeeklySummarySerializer
    end

    def time_played
      @playthroughs = Playthrough.all.order(finished_playing: :desc).limit(10)
      render json: @playthroughs, each_serializer: V1::WeeklySummarySerializer
    end
  end
end

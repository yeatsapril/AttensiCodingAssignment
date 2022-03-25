module V1
  class WeeklySummariesController < ApplicationController
    before_action :set_playthroughs

    def score
      @playthroughs.order(score: :desc).limit(10)
      render json: @playthroughs, each_serializer: V1::WeeklySummarySerializer
    end

    def time_played
      @playthroughs.order(time_spent: :desc).limit(10)
      render json: @playthroughs, each_serializer: V1::WeeklySummarySerializer
    end

    private

    def set_playthroughs
      @playthroughs = Playthrough.where(finished_playing: DateTime.now.beginning_of_week..DateTime.now.end_of_week)
    end
  end
end

module V1
  class ImpactReportsController < ApplicationController
    def index
      players = Player.all.reject { |i| i.playthroughs.empty? }
      render json: players, each_serializer: V1::ImpactReportSerializer
    end
  end
end

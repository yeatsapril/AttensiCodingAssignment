module V1
  class ImpactReportsController < ApplicationController
    def index
      @players = Player.all
      render json: @players, each_serializer: V1::ImpactReportSerializer
    end
  end
end
